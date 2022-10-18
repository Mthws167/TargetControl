import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
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
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<ProfileData> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            child: CircleAvatar(
              backgroundColor: Colors.deepPurpleAccent,
              radius: 70,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 75,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            child: Text(
              (user.email!),
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 90,
            height: 28,
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
                Navigator.of(context).pop();
                FirebaseAuth.instance.signOut();
              },
              child: const Text(
                'Sair',
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
