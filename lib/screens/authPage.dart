import 'package:countpeople/screens/screen-login/login.dart';
import 'package:countpeople/screens/screen-signup/signup.dart';
import 'package:flutter/cupertino.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin? Login( onClickedSignUp: toggle,): SignUp(onClickedSignIn:toggle);

  void toggle() =>setState(() {
    isLogin = !isLogin;
  });
}
