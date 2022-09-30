import 'dart:async';

import 'package:countpeople/screens/screen-pdf/pdf.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(user.email!),
        backgroundColor: Colors.deepPurpleAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        // actions: [
        //   IconButton(
        //     alignment: Alignment.center,
        //     icon: const Icon(Icons.exit_to_app_outlined),
        //     onPressed: () {
        //       FirebaseAuth.instance.signOut();
        //     },
        //   )
        // ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          ProfileData(),
        ],
      ),
    );
}

class ProfileData extends StatefulWidget {
  const ProfileData({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProgressState();
  }
}

class ProgressState extends State<ProfileData> {
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
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 80, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(50, 50),
                      shape: const CircleBorder(
                        side: BorderSide(
                            width: 5, color: Colors.deepPurpleAccent),
                      ),
                      primary: Colors.white),
                  child: const Icon(
                    Icons.add,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {

                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(50, 50),
                      shape: const CircleBorder(
                        side: BorderSide(
                            width: 5, color: Colors.deepPurpleAccent),
                      ),
                      primary: Colors.white),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Mulheres',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 80, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(50, 50),
                      shape: const CircleBorder(
                        side: BorderSide(
                            width: 5, color: Colors.deepPurpleAccent),
                      ),
                      primary: Colors.white),
                  child: const Icon(
                    Icons.add,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {

                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(50, 50),
                      shape: const CircleBorder(
                        side: BorderSide(
                            width: 5, color: Colors.deepPurpleAccent),
                      ),
                      primary: Colors.white),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Crianças',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 80, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(50, 50),
                      shape: const CircleBorder(
                        side: BorderSide(
                            width: 5, color: Colors.deepPurpleAccent),
                      ),
                      primary: Colors.white),
                  child: const Icon(
                    Icons.add,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {

                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(50, 50),
                      shape: const CircleBorder(
                        side: BorderSide(
                            width: 5, color: Colors.deepPurpleAccent),
                      ),
                      primary: Colors.white),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {}
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 250,
          height: 35,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(color: Colors.deepPurpleAccent),
                ),
              ),
            ),
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PDFPage(),
                ),
              );
            },
            child: const Text(
              'Relatório em PDF? Clique Aqui',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
