import 'package:flutter/material.dart';

import '../constants/color.dart';

class WeekelySheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WeekelySheetState();
  }
}

class _WeekelySheetState extends State<WeekelySheet> {
  List<DataColumn> customColumns = [
    buildCustomDataColumn('BT'),
    buildCustomDataColumn('SL'),
    buildCustomDataColumn('AN'),
    buildCustomDataColumn('AL'),
    buildCustomDataColumn('WT'),
    buildCustomDataColumn('ZS'),
  ];

  DataRow generateDataRow(List<String> values) {
    return DataRow(
      cells: values
          .map((value) => DataCell(Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          border: Border.all(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 23.0),
        child: Text(
          value,
          style: TextStyle(color: Colors.black), // You can customize the text style here
        ),
      )))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary Sheet'),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            Container(
              color: AppColors.summaryColor,
              height: 230,
              width: 340,
              padding: EdgeInsets.all(16.0),
              child: Text(
                "BT  =  Bed Time (Time Entering Bed)\n\nSL  =  Sleep Latency (Time Taken To Fall Asleep)\n\nAN =  Number of Awakenings\n\nAL  =  Average Length of Awakenings (Minutes)\n\nWT =  Wake Time (Time of Awakening)\n\nZS  =  Scoops of Zenbev ",
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
                      generateDataRow(['--', '--', '--', '--', '--', '--']),
                      // generateDataRow(['--', '--', '--', '--', '--', '--']),
                      // generateDataRow(['--', '--', '--', '--', '--', '--']),
                      // generateDataRow(['--', '--', '--', '--', '--', '--']),
                      // Add more rows as needed using the generateDataRow function.
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

