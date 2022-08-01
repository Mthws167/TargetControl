import 'package:countpeople/screens/screen-login/login.dart';
import 'package:countpeople/screens/screen-signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Target Control',
    home: Login(),
  ));
}

class TargetControl extends StatefulWidget {
  const TargetControl({Key? key}) : super(key: key);

  @override
  State<TargetControl> createState() => _TargetControlState();
}

class _TargetControlState extends State<TargetControl> {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        routes: {
          '/': (context) => Login(),
          '/SignUp': (context) => SignUp(),
        },
      );
  }
}
