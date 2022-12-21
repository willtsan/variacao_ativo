import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controller/home.controller.dart';

class TableComponent extends StatefulWidget {
  final HomeController controller;

  const TableComponent({Key? key, required this.controller}) : super(key: key);

  @override
  TableComponentState createState() => TableComponentState();
}

class TableComponentState extends State<TableComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        DataTable(
          decoration: BoxDecoration(color: Colors.grey.shade300),
          columns: const [
            DataColumn(
              label: Text('Data'),
            ),
            DataColumn(label: Text('Valor')),
          ],
          rows: List.generate(
              widget.controller.items.length,
              ((index) => DataRow(cells: [
                    DataCell(Text(DateFormat('d-M-y HH:mm')
                        .format(widget.controller.items[index].date))),
                    DataCell(Text(
                        'R${NumberFormat.simpleCurrency().format(widget.controller.items[index].value)}'))
                  ]))),
        ),
      ],
    );
  }
}
