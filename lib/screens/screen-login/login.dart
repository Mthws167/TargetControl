import 'package:countpeople/screens/screen-signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../screen-counter/counter.dart ';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  DateTime timeBackPressed = DateTime.now();

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
                height: 40,
              ),
              Container(
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Counter(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                child: FlatButton(
                  child: const Text(
                    "Cadastre-se aqui",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 13,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ));
}
