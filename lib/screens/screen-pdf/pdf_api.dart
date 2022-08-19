import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> generate() async {
    final user = FirebaseAuth.instance.currentUser!;
    final pdf = Document();

    var invoice;
    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
          SizedBox(height: 3 * PdfPageFormat.cm),
          Header(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  user.email!,
                  style: const TextStyle(fontSize: 24),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: BarcodeWidget(
                    barcode: Barcode.qrCode(),
                    data: invoice.toString(),
                  ),
                ),
              ],
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
          buildLink(),
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

  static Widget buildLink() => UrlLink(
        destination: 'https://github.com/Mthws167',
        child: Text('github.com/Mthws167'),
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final user = FirebaseAuth.instance.currentUser!;
    final style = TextStyle(fontWeight: FontWeight.bold);
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value = user.email!),
      ],
    );
  }
}
