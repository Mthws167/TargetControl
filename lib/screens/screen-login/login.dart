import 'package:countpeople/screens/screen-signup/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

Widget _criarCampo(String rotulo, String? dica, ValueChanged<String>? vincularValor, String? valorInicial){
  return TextFormField(
    decoration: InputDecoration(
        label: Text(rotulo),
        hintText: dica
    ),
    onChanged: vincularValor,
    initialValue: valorInicial ??='',
  );
}


class _LoginState extends State<Login> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Target Control'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_note_sharp),
            onPressed: () =>   Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SignUp())
            )
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(168),
        child: Form(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children :const <Widget>[
              Text('Login:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}