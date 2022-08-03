import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../main.dart';

class Login extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const Login({Key? key,required this.onClickedSignUp}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  DateTime timeBackPressed = DateTime.now();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= const Duration(seconds: 3);

        timeBackPressed = DateTime.now();

        if (isExitWarning) {
          const message = 'Pressione novamente para sair';
          Fluttertoast.showToast(msg: message, fontSize: 15);

          return false;
        } else {
          Fluttertoast.cancel();

          return true;
        }
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 90,
              ),
              SizedBox(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      "assets/images/background.jpg",
                      fit: BoxFit.cover,
                      width: 50,
                      height: 200,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "E-mail:",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Senha:",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 60,
                child: SizedBox.expand(
                  child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                            decorationStyle: TextDecorationStyle.double,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    onPressed: signIn,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(text: TextSpan(
                style: const TextStyle(color: Colors.black),
                text: 'Cadastre-se ',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    text: 'Aqui!',
                    style: const TextStyle(
                      decoration: TextDecoration.underline,color: Colors.deepPurpleAccent
                    ),
                  )
                ]
              ),
              ),
            ],
          ),
        ),
      ));

  Future signIn() async {

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }
}
