
import 'package:countpeople/utils.dart';
import 'package:countpeople/screens/authPage.dart';
import 'package:countpeople/screens/screen-counter/counter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Target Control',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro Inesperado!'));
          } else if (snapshot.hasData) {
            return const Counter();
          } else {
            return const AuthPage();
          }
        },
      ));
}

class TargetControl extends StatefulWidget {
  const TargetControl({Key? key}) : super(key: key);

  @override
  State<TargetControl> createState() => _TargetControlState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _TargetControlState extends State<TargetControl> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
    );
  }
}
