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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 192, 178, 178),
                borderRadius: BorderRadius.circular(50)),
            child: Row(children: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                },
              ),
              Text(_count.toString()),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    _count--;
                    if (_count < 0) {
                      _count = 0;
                    }
                  });
                },
              ),
            ])),
      ],
    );
  }
}
