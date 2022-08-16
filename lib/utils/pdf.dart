import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class Counters {

  final int countMale;
  final int countFemale;
  final int countChield;

  Counters(
      {required this.countMale,
      required this.countFemale,
      required this.countChield});
}

class PdfApi {
  static Future<File> generateTable() async {
    final pdf = Document();

    final headers = [
      'Quantidade de Homens',
      'Quantidade de Mulheres',
      'Quantidade de Crianças'
    ];

    final counters = [
      Counters(
          countMale: 2,
          countFemale: 1,
          countChield: 3),
    ];

    final data = counters
        .map((counters) =>
            [counters.countMale, counters.countFemale, counters.countChield])
        .toList();

    pdf.addPage(Page(
      build: (context) => Table.fromTextArray(
        headers: headers,
        data: data,
      ),
    ));

    return saveDocument(name: 'relarorio.pdf', pdf: pdf);
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
}
