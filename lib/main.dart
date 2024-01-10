import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:meongbti/invite_screen.dart';
import 'dynamic_link.dart';
import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   if (FirebaseDynamicLinks.instance == null) {
//     print("Firebase Dynamic Links is not initialized");
//   } else {
//     print("Firebase Dynamic Links is initialized");
//     createAndPrintDynamicLink();
//   }
//
//   runApp(const MyApp());
// }
// void createAndPrintDynamicLink() async {
//   String _yourPackageName = "com.soojin.meongbti"; // Android 앱의 패키지 이름 설정
//
//   DynamicLinkParameters dynamicLinkParams = DynamicLinkParameters(
//     uriPrefix: "https://soojin.page.link",
//     link: Uri.parse("https://soojin.page.link/test"),
//     androidParameters: AndroidParameters(
//       packageName: _yourPackageName,
//       minimumVersion: 0, // 최소 버전 설정
//     ),
//   );
//
//   try {
//     ShortDynamicLink dynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
//     String url = dynamicLink.shortUrl.toString();
//     print(url);
//   } catch (e) {
//     print("Error generating dynamic link: $e");
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  InitService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MeongBTI',
      initialRoute: '/',
      routes: {
        '/':(context)=>InviteScreen(),
      },
    );
  }
}
