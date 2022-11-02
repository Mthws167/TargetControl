import 'dart:async';

import 'package:countpeople/screens/screen-pdf/pdf.dart';
import 'package:countpeople/screens/screen-profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class Counter extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: IconButton(
              onPressed: () => Navigator.push(
                context,
                PageTransition(
                    child: Profile(), type: PageTransitionType.rightToLeft),
              ),
              icon:
                  const Icon(Icons.person, color: Colors.white),
            ),
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
              ProgressBar(),
            ],
          ),
        ),
      );
}

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ProgressState();
  }
}

class ProgressState extends State<ProgressBar> {
  late int countMale = 0;
  late int countFemale = 0;
  late int countChield = 0;
  late int total = countMale + countFemale + countChield;
  late int quantidadeMax = 100;
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
      countMale = countSnapshotMale.value as int;
      countFemale = countSnapshotFemale.value as int;
      countChield = countSnapshotChield.value as int;
    } catch (err) {
      debugPrint(err.toString());
    }

    _countSubscriptionMale = _countRefMale.onValue.listen(
      (DatabaseEvent event) {
        setState(
          () {
            countMale = (event.snapshot.value ?? 0) as int;
          },
        );
      },
    );
    _countSubscriptionFemale = _countRefFemale.onValue.listen(
      (DatabaseEvent event) {
        setState(
          () {
            countFemale = (event.snapshot.value ?? 0) as int;
          },
        );
      },
    );
    _countSubscriptionChield = _countRefChield.onValue.listen(
      (DatabaseEvent event) {
        setState(
          () {
            countChield = (event.snapshot.value ?? 0) as int;
          },
        );
      },
    );
  }

  countMaxMale() async {
    total = countMale + countFemale + countChield;
    if (total < quantidadeMax) {
      await _countRefMale.set(ServerValue.increment(1));
    }
  }

  countMinumMale() async {
    if (countMale > 0 && countMale != 0) {
      await _countRefMale.set(ServerValue.increment(-1));
    }
    if (countMale <= 0) {
      _countRefMale.set(0);
    }
  }

  countMaxFemale() async {
    total = countMale + countFemale + countChield;
    if (total < quantidadeMax) {
      await _countRefFemale.set(ServerValue.increment(1));
    }
  }

  countMinumFemale() async {
    if (countFemale > 0 && countFemale != 0) {
      await _countRefFemale.set(ServerValue.increment(-1));
    }
    if (countFemale <= 0) {
      _countRefFemale.set(0);
    }
  }

  countMaxChield() async {
    total = countMale + countFemale + countChield;
    if (total < quantidadeMax) {
      await _countRefChield.set(ServerValue.increment(1));
    }
  }

  countMinumChield() async {
    if (countChield > 0 && countChield != 0) {
      await _countRefChield.set(ServerValue.increment(-1));
    }
    if (countChield <= 0) {
      _countRefChield.set(0);
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
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 70, 0),
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
                    countMaxMale();
                  },
                ),
              ),
              Text(
                countMale.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
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
                    countMinumMale();
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
                padding: const EdgeInsets.fromLTRB(30, 0, 70, 0),
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
                    countMaxFemale();
                  },
                ),
              ),
              Text(
                countFemale.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
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
                    countMinumFemale();
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
                padding: const EdgeInsets.fromLTRB(30, 0, 70, 0),
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
                    countMaxChield();
                  },
                ),
              ),
              Text(
                countChield.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
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
                    countMinumChield();
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
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
                  builder: (context) => const PDFPage(),
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
