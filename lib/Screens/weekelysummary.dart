import 'package:flutter/material.dart';

import '../constants/color.dart';

class WeekelySheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WeekelySheetState();

  }
}

class _WeekelySheetState extends State<WeekelySheet> {
  @override
  Widget build(BuildContext context) {
    List<DataColumn> customColumns = [
      buildCustomDataColumn('BT',),
      buildCustomDataColumn('SL'),
      buildCustomDataColumn('AN'),
      buildCustomDataColumn('AL'),
      buildCustomDataColumn('WT'),
      buildCustomDataColumn('ZS'),
    ];


    return Scaffold(
      appBar: AppBar(
        title: Text('Summary Sheet'),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0, left: 10.0,right:10.0),
        child: Column(
          children: [
            Container(
              color: AppColors.summaryColor,
              height: 230,
              width: 340,
              padding: EdgeInsets.all(16.0),
              child: Text(
                "BT  =  Bed Time (Time Entering Bed)\n\nSL  =  Sleep Latency (Time  Taken To Fall Asleep)\n\nAN =  Number of Awakenings\n\nAL  =  Average Length of Awakenings\n\nWT =  Wake Time (Time of Awakening)\n\nZS  =  Scoops of Zenbev ",
                style: TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [
                  DataTable(
                    columnSpacing: 8.0,
                    columns: customColumns,

                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Value1')),
                        DataCell(Text('Value2')),
                        DataCell(Text('Value3')),
                        DataCell(Text('Value4')),
                        DataCell(Text('Value5')),
                        DataCell(Text('Value6')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Value7')),
                        DataCell(Text('Value8')),
                        DataCell(Text('Value9')),
                        DataCell(Text('Value10')),
                        DataCell(Text('Value11')),
                        DataCell(Text('Value12')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Value7')),
                        DataCell(Text('Value8')),
                        DataCell(Text('Value9')),
                        DataCell(Text('Value10')),
                        DataCell(Text('Value11')),
                        DataCell(Text('Value12')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Value7')),
                        DataCell(Text('Value8')),
                        DataCell(Text('Value9')),
                        DataCell(Text('Value10')),
                        DataCell(Text('Value11')),
                        DataCell(Text('Value12')),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DataColumn buildCustomDataColumn(String label) {
  return DataColumn(
    label: Container(
      decoration: BoxDecoration(
        color: AppColors.buttonColor, // Background color of the header
        border: Border.all(color: AppColors.buttonColor, width: 1.0), // Border around the header
      ),
      padding: EdgeInsets.only(left: 20.0, right: 18.0, top: 3, bottom: 3),
      child: Text(
        label,
        style: TextStyle(), // You can customize the text style here
      ),
    ),
  );
}




