import 'dart:async';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';

import 'kakao_message.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key});

  @override
  State<StatefulWidget> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<ShortDynamicLink?> _createDynamicLink() async {
    final dynamicLinkParams = DynamicLinkParameters(
      link:
      Uri.parse("https://soojin.page.link/invite?code=12345"),
      uriPrefix: "https://soojin.page.link",
      androidParameters: const AndroidParameters(
          packageName: "com.soojin.meongbti"),
      iosParameters: const IOSParameters(bundleId: "com.example.app.ios"),
    );
    try {
      final dynamicLink =
      await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
      return dynamicLink;
    } catch (e) {
      print("다이나믹링크 생성 error : $e");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Links Example'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: ElevatedButton(
                onPressed: () async => tapLink(),
                child: const Text('초대코드 공유하기'),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> tapLink() async {
    final link = await _createDynamicLink();
    if (link == null) return;
    // 카카오톡 실행 가능 여부 확인
    bool isKakaoTalkSharingAvailable =
    await ShareClient.instance.isKakaoTalkSharingAvailable();

    if (isKakaoTalkSharingAvailable) {
      try {
        Uri uri = await ShareClient.instance.shareDefault(
            template: KakaoMessageTemplate().toDefaultFeed(link.shortUrl));
        await ShareClient.instance.launchKakaoTalk(uri);
        print('카카오톡 공유 완료');
      } catch (error) {
        print('카카오톡 공유 실패 $error');
      }
    } else {
      try {
        Uri shareUrl = await WebSharerClient.instance.makeDefaultUrl(
            template: KakaoMessageTemplate().toDefaultFeed(link.shortUrl));
        await launchBrowserTab(shareUrl, popupOpen: true);
      } catch (error) {
        print('카카오톡 공유 실패 $error');
      }
    }
  }
}