import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> generate() async {
    final user = FirebaseAuth.instance.currentUser!;
    final pdf = Document();

    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
          buildLink(),
          ...buildBulletPoints(),
          Header(
            child: Text(
              user.email!,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Paragraph(
            text: LoremText().paragraph(60),
          ),
          Paragraph(
            text: LoremText().paragraph(60),
          ),
          Paragraph(
            text: LoremText().paragraph(60),
          ),
        ],
      ),
    );
    return saveDocument(name: 'Relatório.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }

  static List<Widget> buildBulletPoints() => [
    Bullet(text: 'First'),
    Bullet(text: 'Second'),
    Bullet(text: 'Third'),
  ];

  static Widget buildLink()=> UrlLink(
    destination: 'https://github.com/Mthws167',
    child: Text('github.com/Mthws167'),
  );
}
