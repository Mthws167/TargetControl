import 'package:countpeople/screens/screen-inittial-loading/initial-loading.dart';
import 'package:countpeople/screens/screen-login/login.dart';
import 'package:countpeople/screens/screen-signup/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Target Control',
    home: InitialLoading(),
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
    );
  }

}
