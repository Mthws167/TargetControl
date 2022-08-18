import 'package:countpeople/screens/screen-pdf/pdf_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PDFPage extends StatelessWidget {
  const PDFPage({Key? key}) : super(key: key);

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
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                  PDFState(),
              ],
            ),
          ),
        ),
      );
}

class PDFState extends StatefulWidget {
  const PDFState({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PDFBody();
  }
}

class _PDFBody extends State<PDFState> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 200,
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
             final pdfFile =  await PdfApi.generateCenteredText(user.email!);

              PdfApi.openFile(pdfFile);
            },
            child: const Text('Gerar relatório em PDF',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                )),
          ),
        ),
        Container(
          height: 15,
        ),
        SizedBox(
          width: 200,
          height: 35,
          child: ElevatedButton.icon(
            label: const Text('Voltar para o início',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                )),
            icon: const Icon(
              Icons.keyboard_return,
              color: Colors.deepPurpleAccent,
            ),
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
            },
          ),
        ),
      ],
    );
  }
}
