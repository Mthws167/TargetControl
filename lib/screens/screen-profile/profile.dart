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
          title: Text(user.displayName!),
          backgroundColor: Colors.deepPurpleAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
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
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            child: Text(
              (user.email!),
              style: const TextStyle(
                  fontSize: 18, decoration: TextDecoration.overline),
            ),
          ),
          const SizedBox(
            height: 40,
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
      ),
    );
  }
}
