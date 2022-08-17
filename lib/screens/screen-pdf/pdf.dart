
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          actions: [
            IconButton(
                alignment: Alignment.center,
                icon: Icon(Icons.exit_to_app_outlined),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              PDFState(),
            ],
          ),
        ),
      ));
}

class PDF extends StatelessWidget {
  PDF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          actions: [
            IconButton(
                alignment: Alignment.center,
                icon: Icon(Icons.exit_to_app_outlined),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                })
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              PDFState(),
            ],
          ),
        ),
      ));
}

class PDFState extends StatefulWidget {
  const PDFState({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PDFBody();
  }
}

class _PDFBody extends State<PDFState> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Homens',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          width: 200,
          height: 35,
          child: ElevatedButton(
            child: const Text('Gerar relatório em PDF',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                )),

            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.deepPurpleAccent)))),
            onPressed: () async{

            },
          ),
        ),
      ],
    );
  }

}
