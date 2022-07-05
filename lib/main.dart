import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "TargetControl",
    home: TargetControl(),
  ));
}

class TargetControl extends StatefulWidget {
  const TargetControl({Key? key}) : super(key: key);

  @override
  State<TargetControl> createState() => _TargetControlState();
}

class _TargetControlState extends State<TargetControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(top: 23),),
            Text(
              "Homens",
              style: TextStyle(fontSize: 20),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text(
                    "-",
                    style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.white,
                  onPressed: () {},
                  color: Color.fromARGB(255, 9, 144, 156),
                ),
                Text(
                  "0",
                  style: TextStyle(fontSize: 20),
                ),
                RaisedButton(
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.white,
                  onPressed: () {},
                  color: Color.fromARGB(255, 9, 144, 156),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
