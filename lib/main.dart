import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:countpeople/screens/authPage.dart';
import 'package:countpeople/screens/screen-counter/counter.dart';
import 'package:countpeople/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'firebase_options.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const SplashScreen());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home:TargetControl(),
      );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset('assets/splash/112042-target-commercial.json'),
        backgroundColor: Colors.black,
        nextScreen: const MyApp(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}


class TargetControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(  
                child: CircularProgressIndicator(
                  color: Colors.deepPurpleAccent,
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Erro Inesperado!'),
              );
            } else if (snapshot.hasData) {
              return Counter();
            } else {
              return const AuthPage();
            }
          },
        ),
      );
}
