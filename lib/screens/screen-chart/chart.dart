import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen-menu/menu.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurpleAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          actions: [
           IconButton(
             alignment: Alignment.topLeft,
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              })],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[

            ],
          ),
        ),
      ));
}
