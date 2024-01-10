import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';

class InitService {
  static Future<void> init() async {
    // kakao
    // runApp() 호출 전 Flutter SDK 초기화
    KakaoSdk.init(
      nativeAppKey: 'b8f9c14d51d78ba9c1737f350194056c',
      javaScriptAppKey: '211a8086a2e5490bea9f7df6342c17b8',
    );

    //firebase dynamic link
    //종료상태 링크 수신
    final PendingDynamicLinkData? initialLink =
    await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      final Uri deepLink = initialLink.link;
      // Example of using the dynamic link to push the user to a different screen
      print("다이나믹링크수신(앱종료상태)_ : $deepLink");
    }

    //포그라운드,백그라운드상태 다이나믹 링크 수신
    FirebaseDynamicLinks.instance.onLink.listen(
          (pendingDynamicLinkData) {
        // Set up the `onLink` event listener next as it may be received here
        final Uri deepLink = pendingDynamicLinkData.link;
        // Example of using the dynamic link to push the user to a different screen
        print("다이나믹링크수신(앱 실행중) : $deepLink");
      },
    );
  }
}