import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';

class KakaoMessageTemplate {
  KakaoMessageTemplate();

  FeedTemplate toDefaultFeed(Uri mobileWebUrl) {
    return FeedTemplate(
      content: Content(
        title: '메리 미',
        description: '캘린더 공유 요청을 수락해주세요!',
        imageUrl: Uri.parse(
            'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png'),
        link: Link(
            webUrl: Uri.parse('https://developers.kakao.com'),
            mobileWebUrl: Uri.parse('https://developers.kakao.com')),
      ),
      buttons: [
        Button(
          title: '초대 수락하기~',
          link: Link(
            webUrl: Uri.parse('https://developers.kakao.com'),
            mobileWebUrl: mobileWebUrl,
          ),
        ),
      ],
    );
  }
}