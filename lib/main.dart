import 'package:countpeople/screens/authPage.dart';
import 'package:countpeople/screens/screen-counter/counter.dart';
import 'package:countpeople/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: TargetControl(),
      );
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
