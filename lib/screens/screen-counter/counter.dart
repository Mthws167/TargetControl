import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Target Control"),
          backgroundColor: Colors.deepPurpleAccent,
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ProgressBar(),
            ],
          ),
        ),
      ));
}

class ProgressBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProgressState();
  }
}

class _ProgressState extends State<ProgressBar> {
  int _count = 0;
  late final DatabaseReference _countRef;
  late StreamSubscription<DatabaseEvent> _countSubscription;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _countRef = FirebaseDatabase.instance.ref('count');
    try {
      final countSnapshot = await _countRef.get();
      _count = countSnapshot.value as int;
    } catch (err) {
      debugPrint(err.toString());
    }

    _countSubscription = _countRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        _count = (event.snapshot.value ?? 0) as int;
      });
    });
  }

  countMale() async {
    await _countRef.set(ServerValue.increment(1));
  }

  countFemale() async {
    await _countRef.set(ServerValue.increment(1));
  }

  countChield() async {
    await _countRef.set(ServerValue.increment(1));
  }

  countMinumMale() async {
    if (_count > 0 && _count != 0) {
      await _countRef.set(ServerValue.increment(-1));
    }
    if (_count <= 0) {
      _countRef.set(0);
    }
  }

  countMinumFemale() async {
    if (_count > 0 && _count != 0) {
      await _countRef.set(ServerValue.increment(-1));
    }
    if (_count <= 0) {
      _countRef.set(0);
    }
  }

  countMinumChield() async {
    if (_count > 0 && _count != 0) {
      await _countRef.set(ServerValue.increment(-1));
    }
    if (_count <= 0) {
      _countRef.set(0);
    }
  }

  @override
  void dispose() {
    _countSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Text(
            'Homem',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
            child: Row(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 80, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(60, 60),
                      shape: CircleBorder(),
                      primary: Colors.deepPurpleAccent),
                  child: Icon(Icons.add),
                  onPressed: () {
                    countMale();
                  },
                ),
              ),
              Container(
                child: Text(
                  _count.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(60, 60),
                      shape: CircleBorder(),
                      primary: Colors.deepPurpleAccent),
                  child: Icon(Icons.remove),
                  onPressed: () {
                    countMinumMale();
                  },
                ),
              ),
            ])),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Mulher',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
            child: Row(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 80, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(60, 60),
                      shape: CircleBorder(),
                      primary: Colors.deepPurpleAccent),
                  child: Icon(Icons.add),
                  onPressed: () {
                    countFemale();
                  },
                ),
              ),
              Container(
                child: Text(
                  _count.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(60, 60),
                      shape: CircleBorder(),
                      primary: Colors.deepPurpleAccent),
                  child: Icon(Icons.remove),
                  onPressed: () {
                    countMinumFemale();
                  },
                ),
              ),
            ])),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Criança',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 80, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(60, 60),
                      shape: CircleBorder(),
                      primary: Colors.deepPurpleAccent),
                  child: Icon(Icons.add),
                  onPressed: () {
                    countChield();
                  },
                ),
              ),
              Container(
                child: Text(
                  _count.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(60, 60),
                      shape: CircleBorder(),
                      primary: Colors.deepPurpleAccent),
                  child: Icon(Icons.remove),
                  onPressed: () {
                    countMinumChield();
                  },
                ),
              ),
            ])),
      ],
    );
  }
}
