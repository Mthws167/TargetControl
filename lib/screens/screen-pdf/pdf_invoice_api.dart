import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfInvoiceApi {
  static Future<File> generate(Invoice invoice) async {
    final pdf = Document();
    pdf.addPage(
      MultiPage(
        build: (context) => [
          buildTitle(invoice),
          buildInvoice(invoice),
        ],
      ),
    );

    return PdfApi.saveDocument(name: 'Relatório.pdf', pdf: pdf);
  }

  static Widget buildTitle(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Relatório',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Text(invoice.info.description),
        ],
      );

  static Widget buildInvoice(Invoice invoice) {
    final headers = ['Descrição', 'Data', 'Quantidade'];
    final data = invoice.items.map((item) {
      return [
        item.description,
        Utils.formatDate(item.date),
        '${item.quantity}',
      ];
    }).toList();
    return Table.fromTextArray(
        headers: headers,
        data: data,
        border: null,
        headerStyle: TextStyle(fontWeight: FontWeight.bold),
        headerDecoration: BoxDecoration(color: PdfColor.fromRYB(224, 224, 224)),
        cellHeight: 30,
        cellAlignments: {
          0: Alignment.centerLeft,
          1: Alignment.centerRight,
          2: Alignment.centerRight,
          3: Alignment.centerRight,
          4: Alignment.centerRight,
          5: Alignment.centerRight,
        },
    );
  }
}
