import 'package:countpeople/screens/screen-login/login.dart';
import 'package:countpeople/screens/screen-counter/counter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: TargetControl(),
  );
}


class TargetControl extends StatelessWidget {
  const TargetControl({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.deepPurpleAccent,
                ));
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro Inesperado!'));
              } else if (snapshot.hasData) {
                return Counter();
              } else {
                return Login();
              }
            }),
      );
}
