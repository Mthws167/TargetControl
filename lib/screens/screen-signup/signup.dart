import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  const SignUp({Key? key,required this.onClickedSignIn}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async => false,
    child: Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 150,
            ),
            TextFormField(
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
              height: 80,
            ),
            Container(
              height: 60,
              child: SizedBox.expand(
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Cadastrar",
                        style: TextStyle(
                          decorationStyle: TextDecorationStyle.double,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style:  TextStyle(color: Colors.black,fontSize: 13),
                    text: 'Já possui conta? ',
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignIn,
                          text: 'Login',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.deepPurpleAccent,
                            fontSize: 13,
                          )
                      ),
                    ]
                ),
              ),
            ),
          ],
        ),
      ),
    ));
}
