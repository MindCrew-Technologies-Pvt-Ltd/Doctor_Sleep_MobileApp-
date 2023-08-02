import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../constants/string.dart';



class SleepDiary extends StatefulWidget {
  @override
  _SleepDiaryState createState() => _SleepDiaryState();
}

class _SleepDiaryState extends State<SleepDiary> {

  int numberOfContainers = 0; // Set the initial number of sleep data containers you want to display

  List<String> getColumnHeaders(int weekNumber) {
    DateTime currentDate = DateTime.now();

    // Calculate the start date of the current week
    DateTime weekStartDate = currentDate.subtract(Duration(days: currentDate.weekday - 1));

    // Adjust the start date based on the week number
    weekStartDate = weekStartDate.add(Duration(days: (weekNumber - 1) * 7));

    List<String> headers = [];

    // Add the dates for the target week to the list as headers
    for (int i = 0; i < 7; i++) {
      DateTime date = weekStartDate.add(Duration(days: i));
      String header = '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.';
      headers.add(header);
    }

    return headers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ENTER SLEEP DIARY HERE'),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.info_outlined, size: 20),
                    Text(
                      Strings.sleepdiarytime,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(9.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add_circle_outline_outlined, size: 40),
                    onPressed: _addNewContainer,
                  ),
                  SizedBox(width: 15),
                  Text(
                    Strings.register,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add your button's onPressed logic here
                    },
                    child: Text(
                      'Save Data',
                      style: TextStyle(fontSize: 10),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.accentColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Column(
                children: List.generate(
                  numberOfContainers,
                      (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Card(
                      elevation: 4,
                      child: _buildSleepDataContainer(index + 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _addNewContainer() {
    if (numberOfContainers < 30) {
      setState(() {
        numberOfContainers++; // Increment the number of sleep data containers
      });
    }
  }

  Widget _buildSleepDataContainer(int weekNumber) {
    return Container(
      height: 422,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              color: AppColors.primaryColor,
            ),
            child: Text(
              'Week $weekNumber',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 1.0),
                child: buildSleepDataTable(weekNumber),
              ),
            ),
          ),
          SizedBox(height: 1), // Add spacing between the DataTable and the text container
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(8),
              color: AppColors.averageColor, // Replace with your desired color
              child: Text(
                'AVERAGE VALUES',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black, // Replace with your desired text color
                ),
              ),
            ),
          ),
          // SizedBox(height:20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1),
            child: SingleChildScrollView( // New SingleChildScrollView for the row of 6 containers
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildAverageContainer('BT'),
                  buildAverageContainer('SL'),
                  buildAverageContainer('AN'),
                  buildAverageContainer('AL'),
                  buildAverageContainer('WT'),
                  buildAverageContainer('ZS'),
                ],
              ),
            ),
          ),
          SizedBox(height: 1), // Add some spacing after the existing row of containers

          // New row of 6 containers
          Container(
            padding: EdgeInsets.symmetric(vertical: 1),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildAverageContainer('-'),
                  buildAverageContainer('-'),
                  buildAverageContainer('-'),
                  buildAverageContainer('-'),
                  buildAverageContainer('-'),
                  buildAverageContainer('-'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAverageContainer(String text) {
    return Container(
      width: 36,
      height: 25,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.buttonColor, // Replace with your desired container color
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
    );
  }

  Widget buildSleepDataTable(int weekNumber) {
    List<String> columnHeaders = getColumnHeaders(weekNumber);

    return DataTable(
      dataRowHeight: 35.0,
      columnSpacing: 10,
      horizontalMargin: 1,
      dividerThickness: 0.0,
      columns: [
        buildCustomDataColumn('', AppColors.waste),
        for (String header in columnHeaders)
          buildCustomDataColumn(header, AppColors.buttonColor),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 55),
            decoration: BoxDecoration(
              color: AppColors.week1text,
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Text(
              'Bed Time',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          )),
          for (int i = 0; i < 7; i++)
            DataCell(_buildRoundedTextField('')),
        ]),
        DataRow(cells: [
          DataCell(Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 43),
            decoration: BoxDecoration(
              color: AppColors.week1text,
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Text(
              'Sleep Latency',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          )),
          for (int i = 0; i < 7; i++)
            DataCell(_buildRoundedTextField('')),
        ]),
        DataRow(cells: [
          DataCell(Container(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 49),
            decoration: BoxDecoration(
              color: AppColors.week1text,
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Text(
              'Number of\nAwakenings',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          )),
          for (int i = 0; i < 7; i++)
            DataCell(_buildRoundedTextField('')),
        ]),
        DataRow(cells: [
          DataCell(Container(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 28),
            decoration: BoxDecoration(
              color: AppColors.week1text,
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Text(
              '  Average Length of\n        Awakening',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          )),
          for (int i = 0; i < 7; i++)
            DataCell(_buildRoundedTextField('')),
        ]),
        DataRow(cells: [
          DataCell(Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 50),
            decoration: BoxDecoration(
              color: AppColors.week1text,
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Text(
              'Wake Time',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          )),
          for (int i = 0; i < 7; i++)
            DataCell(_buildRoundedTextField('')),
        ]),
        DataRow(cells: [
          DataCell(Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 29),
            decoration: BoxDecoration(
              color: AppColors.week1text,
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Text(
              'Scoops of Zenbev',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          )),
          for (int i = 0; i < 7; i++)
            DataCell(_buildRoundedTextField('')),
        ]),
      ],
    );
  }

  DataColumn buildCustomDataColumn(String label, Color backgroundColor) {
    return DataColumn(
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: AppColors.buttonColor, width: 0.0),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedTextField(String initialValue) {
    return Container(
      width: 60,
      height: 25,
      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(color: Colors.grey),
      ),
      child: TextField(
        controller: TextEditingController(text: initialValue),
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
  String _getMonthAbbreviation(int month) {
    return DateTime(2021, month).toString().split(' ')[1];
  }
}
