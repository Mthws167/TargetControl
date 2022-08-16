import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../screen-menu/menu.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        endDrawer: Menu(),
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              ProgressBar(),
            ],
          ),
        ),
      ));
}

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProgressState();
  }
}

class _ProgressState extends State<ProgressBar> {
  int _countMale = 0;
  int _countFemale = 0;
  int _countChield = 0;
  late final DatabaseReference _countRefMale;
  late StreamSubscription<DatabaseEvent> _countSubscriptionMale;
  late final DatabaseReference _countRefFemale;
  late StreamSubscription<DatabaseEvent> _countSubscriptionFemale;
  late final DatabaseReference _countRefChield;
  late StreamSubscription<DatabaseEvent> _countSubscriptionChield;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _countRefMale = FirebaseDatabase.instance.ref('countMale');
    _countRefFemale = FirebaseDatabase.instance.ref('countFemale');
    _countRefChield = FirebaseDatabase.instance.ref('countChield');
    try {
      final countSnapshotMale = await _countRefMale.get();
      final countSnapshotFemale = await _countRefFemale.get();
      final countSnapshotChield = await _countRefChield.get();
      _countMale = countSnapshotMale.value as int;
      _countFemale = countSnapshotFemale.value as int;
      _countChield = countSnapshotChield.value as int;
    } catch (err) {
      debugPrint(err.toString());
    }

    _countSubscriptionMale =
        _countRefMale.onValue.listen((DatabaseEvent event) {
      setState(() {
        _countMale = (event.snapshot.value ?? 0) as int;
      });
    });
    _countSubscriptionFemale =
        _countRefFemale.onValue.listen((DatabaseEvent event) {
      setState(() {
        _countFemale = (event.snapshot.value ?? 0) as int;
      });
    });
    _countSubscriptionChield =
        _countRefChield.onValue.listen((DatabaseEvent event) {
      setState(() {
        _countChield = (event.snapshot.value ?? 0) as int;
      });
    });
  }

  countMale() async {
    await _countRefMale.set(ServerValue.increment(1));
    if (_countMale >= 100) {
      _countRefMale.set(100);
    }
  }

  countMinumMale() async {
    if (_countMale > 0 && _countMale != 0) {
      await _countRefMale.set(ServerValue.increment(-1));
    }
    if (_countMale <= 0) {
      _countRefMale.set(0);
    }
  }

  countMinumFemale() async {
    if (_countFemale > 0 && _countFemale != 0) {
      await _countRefFemale.set(ServerValue.increment(-1));
    }
    if (_countFemale <= 0) {
      _countRefFemale.set(0);
    }
  }

  countFemale() async {
    await _countRefFemale.set(ServerValue.increment(1));
    if (_countFemale >= 100) {
      _countRefFemale.set(100);
    }
  }

  countMinumChield() async {
    if (_countChield > 0 && _countChield != 0) {
      await _countRefChield.set(ServerValue.increment(-1));
    }
    if (_countChield <= 0) {
      _countRefChield.set(0);
    }
  }

  countChield() async {
    await _countRefChield.set(ServerValue.increment(1));
    if (_countChield >= 100) {
      _countRefChield.set(100);
    }
  }

  @override
  void dispose() {
    _countSubscriptionMale.cancel();
    _countSubscriptionFemale.cancel();
    _countSubscriptionChield.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Homens',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
            child: Row(children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 80, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(60, 60),
                      shape: const CircleBorder(
                          side: BorderSide(
                              width: 5, color: Colors.deepPurpleAccent)),
                      primary: Colors.white),
                  child: const Icon(
                    Icons.add,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    countMale();
                  },
                ),
              ),
              Text(
                _countMale.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(60, 60),
                      shape: const CircleBorder(
                          side: BorderSide(
                              width: 5, color: Colors.deepPurpleAccent)),
                      primary: Colors.white),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    countMinumMale();
                  },
                ),
              ),
            ])),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Mulheres',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
            child: Row(children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 80, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(60, 60),
                      shape: const CircleBorder(
                          side: BorderSide(
                              width: 5, color: Colors.deepPurpleAccent)),
                      primary: Colors.white),
                  child: const Icon(
                    Icons.add,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    countFemale();
                  },
                ),
              ),
              Text(
                _countFemale.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(60, 60),
                      shape: const CircleBorder(
                          side: BorderSide(
                              width: 5, color: Colors.deepPurpleAccent)),
                      primary: Colors.white),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    countMinumFemale();
                  },
                ),
              ),
            ])),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Crianças',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
            child: Row(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 80, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(60, 60),
                      shape: const CircleBorder(
                          side: BorderSide(
                              width: 5, color: Colors.deepPurpleAccent)),
                      primary: Colors.white),
                  child: const Icon(
                    Icons.add,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    countChield();
                  },
                ),
              ),
              Text(
                _countChield.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(60, 60),
                      shape: const CircleBorder(
                          side: BorderSide(
                              width: 5, color: Colors.deepPurpleAccent)),
                      primary: Colors.white),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    countMinumChield();
                  },
                ),
              ),
            ])),
        Container(
          child: Row(children: <Widget>[]),
        ),
      ],
    );
  }
}
