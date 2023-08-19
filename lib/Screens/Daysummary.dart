/*

import 'package:flutter/material.dart';

import '../constants/color.dart';

import '../database_helper.dart';
import 'sleep_data.dart';

class WeekelySheet extends StatefulWidget {
  @override




  State<StatefulWidget> createState() {
    return _WeekelySheetState();
  }
}

class _WeekelySheetState extends State<WeekelySheet> {

  List<SleepData> sleepDataList = [];
  Map<int, List<SleepData>> groupedData = {};

  @override
  void initState() {
    super.initState();
    _loadSleepData();

  }

  _loadSleepData() async {
    // List<SleepData> dataList =  dbHelper.getAllSleepData() as List<SleepData>;
    // groupedData = groupSleepDataByWeek(dataList);

    // setState(() {
    //   // sleepDataList = dataList;
    // });
  }

  // Map<int, List<SleepData>> groupSleepDataByWeek(List<SleepData> dataList) {
  //   Map<int, List<SleepData>> result = {};
  //
  //   for (var sleepData in dataList) {
  //     if (!result.containsKey(sleepData.weekNumber)) {
  //       result[sleepData.weekNumber] = [];
  //     }
  //     result[sleepData.weekNumber]!.add(sleepData);
  //   }
  //
  //   return result;
  // }

  Map<String, String> calculateWeeklyAverages(List<SleepData> weekData) {
    if (weekData.isEmpty) return {};

    double totalBedTime = 0;
    double totalSleepLatencyInMinutes = 0;
    int totalNumberOfAwakenings = 0;
    int totalAverageLengthAwakening = 0;
    double totalWakeTime = 0;
    int totalScoopsZenbev = 0;
    // Calculate other fields as needed

    // for (var entry in weekData) {
    //   totalBedTime += convertTimeToMinutes(entry.bedTime);
    //   totalSleepLatencyInMinutes += convertTimeToMinutes(entry.sleepLatency);
    //   totalNumberOfAwakenings += entry.numberOfAwakenings as int;
    //   totalAverageLengthAwakening += int.tryParse(entry.averageLengthAwakening) ?? 0;
    //   totalWakeTime += convertTimeToMinutes(entry.wakeTime);
    //   totalScoopsZenbev += int.tryParse(entry.scoopsZenbev) ?? 0;
    //   // Add other fields' calculations
    // }

    double averageBedTime = totalBedTime / weekData.length;
    double averageSleepLatencyInMinutes = totalSleepLatencyInMinutes / weekData.length;
    double averageNumberOfAwakenings = totalNumberOfAwakenings / weekData.length;
    double averageAverageLengthAwakening = totalAverageLengthAwakening / weekData.length;
    double averageWakeTime = totalWakeTime / weekData.length;
    double averageScoopsZenbev = totalScoopsZenbev / weekData.length;
    // Calculate other averages

    return {
      'bedTime': convertMinutesToTime(averageBedTime),
      'sleepLatency': averageSleepLatencyInMinutes.toStringAsFixed(2),
      'numberOfAwakenings': averageNumberOfAwakenings.toStringAsFixed(2),
      'averageLengthAwakening': averageAverageLengthAwakening.toStringAsFixed(2),
      'wakeTime': convertMinutesToTime(averageWakeTime),
      'scoopsZenbev': averageScoopsZenbev.toStringAsFixed(2),
      // Add other fields' averages
    };
  }


  int convertTimeToMinutes(String time) {
    var parts = time.split(':');
    if (parts.length != 2) {
      // Handle invalid input format
      return 0;
    }
    int hours = int.tryParse(parts[0]) ?? 0;
    int minutes = int.tryParse(parts[1]) ?? 0;
    return hours * 60 + minutes;
  }


  String convertMinutesToTime(double minutes) {
    int hours = (minutes ~/ 60).toInt();
    int remainingMinutes = (minutes % 60).toInt();
    return '$hours:${remainingMinutes.toString().padLeft(2, '0')}';
  }

  // Map<int, List<SleepData>> groupSleepDataByWeek(List<SleepData> dataList) {
  //   Map<int, List<SleepData>> result = {};
  //
  //   for (var sleepData in dataList) {
  //     if (!result.containsKey(sleepData.weekNumber)) {
  //       result[sleepData.weekNumber] = [];
  //     }
  //     result[sleepData.weekNumber]!.add(sleepData);
  //   }
  //
  //   return result;
  // }


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
        title: Text(Strings.appbarSS),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
      child:Padding(
        padding: EdgeInsets.only(top: 16.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            Container(
              color: AppColors.summaryColor,
              height: 230,
              width: 340,
              padding: EdgeInsets.all(16.0),
              child: Text(
                Strings.textss,
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                itemCount: groupedData.keys.length,
                itemBuilder: (BuildContext context, int index) {
                  int weekNumber = groupedData.keys.elementAt(index);
                  List<SleepData> weekData = groupedData[weekNumber] ?? [];
                  Map<String, String> weeklyAverages = calculateWeeklyAverages(weekData);

                  if (weekData.isNotEmpty) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.averageColor,
                              border: Border.all(color: Colors.black, width: 1.0), // Add border to the container
                            ),
                            padding: EdgeInsets.all(7.0), // Add padding to create space around the text
                            child: Text("W$weekNumber"),
                          ),
                  SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                 child: DataTable(
                      columnSpacing: 8.0,
                      columns: customColumns,
                      rows: [
                        DataRow(
                          cells: [

                            DataCell(Padding(
                              padding: const EdgeInsets.only(left:1.0,bottom:13),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  border: Border.all(color: AppColors.buttonColor, width: 1.0), // Add border to cells
                                ),
                                padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                                child: Center(
                                  child: Text(weeklyAverages['bedTime']!),
                                ),
                              ),
                            )),
                            DataCell(Padding(
                              padding: const EdgeInsets.only(left:1.0,bottom:13),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  border: Border.all(color: AppColors.buttonColor, width: 1.0), // Add border to cells
                                ),
                                padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                                child: Center(
                                  child: Text(weeklyAverages['sleepLatency']!),
                                ),
                              ),
                            )),
                            DataCell(Padding(
                              padding: const EdgeInsets.only(left:1.0,bottom:13),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  border: Border.all(color: AppColors.buttonColor, width: 1.0), // Add border to cells
                                ),
                                padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                                child: Center(
                                  child: Text(weeklyAverages['numberOfAwakenings']!),
                                ),
                              ),
                            )),
                            DataCell(Padding(
                              padding: const EdgeInsets.only(left:1.0,bottom:13),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  border: Border.all(color: AppColors.buttonColor, width: 1.0), // Add border to cells
                                ),
                                padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                                child: Center(
                                  child: Text(weeklyAverages['averageLengthAwakening']!),
                                ),
                              ),
                            )),
                            DataCell(Padding(
                              padding: const EdgeInsets.only(left:1.0,bottom:13),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  border: Border.all(color: AppColors.buttonColor, width: 1.0), // Add border to cells
                                ),
                                padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                                child: Center(
                                  child: Text(weeklyAverages['wakeTime']!),
                                ),
                              ),
                            )),
                            DataCell(Padding(
                              padding: const EdgeInsets.only(left:1.0,bottom:13),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  border: Border.all(color: AppColors.buttonColor, width: 1.0), // Add border to cells
                                ),
                                padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                                child: Center(
                                  child: Text(weeklyAverages['scoopsZenbev']!),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ],
                          )
                          )
                  )
                          ]
                    );
                  } else {
                    return SizedBox.shrink(); // Return an empty widget if weekData is empty
                  }
                },
              ),


          ],
        ),
      ),
      )
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

*/
import 'package:doctor_sleep/Screens/languages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting

import '../constants/color.dart';


import '../database_helper.dart';
import 'sleep_data.dart';

class WeekelySheet extends StatefulWidget {
  @override
  _WeekelySheetState createState() => _WeekelySheetState();
}

class _WeekelySheetState extends State<WeekelySheet> {
  int currentDay = 1;
  Map<int, SleepData> sleepEntryByDay = {}; // Keep one entry per day

  @override
  void initState() {
    super.initState();
    // Fetch sleep entries from the database and update the map
    _fetchSleepEntries();
  }

  _fetchSleepEntries() async {
    try {
      List<SleepData> entries = await SleepDataDatabase().getSortedSleepDataByDate();
      // Organize entries by day
      for (var entry in entries) {
        DateTime date = DateTime.parse(entry.date); // Parse the date string to DateTime
        int day = date.day; // Extract the day from the DateTime
        sleepEntryByDay[day] ??= entry;
      }

      setState(() {});
    } catch (e) {
      print('Error fetching sleep entries: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DataColumn> customColumns = [
      buildCustomDataColumn('BT'),
      buildCustomDataColumn('SL'),
      buildCustomDataColumn('AN'),
      buildCustomDataColumn('AL'),
      buildCustomDataColumn('WT'),
      buildCustomDataColumn('ZS'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(Languages.of(context)!.appbarSS),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 17.0, left: 10.0, right: 10.0),
          child: Column(
            children: [
              Container(
                color: AppColors.summaryColor,
                height: 230,
                width: 370,
                padding: EdgeInsets.all(20.0),
                child: Text(
                  Languages.of(context)!.textss,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 8),
              Column(
                children: (() {
                  final entries = sleepEntryByDay.entries.toList();

                  List<Widget> widgets = [];

                  for (int dayIndex = 0; dayIndex < entries.length; dayIndex++) {
                    final entry = entries[dayIndex];
                    final day = entry.key;
                    final sleepEntry = entry.value;

                    if (sleepEntry != null) {
                      final serialNumber = dayIndex + 1;

                      widgets.add(
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              Text('Day $serialNumber - ${_getFormattedDate(sleepEntry.date)}'),
                              DataTable(
                                columnSpacing: 8.0,
                                columns: customColumns,
                                rows: [generateDataRow(sleepEntry)].toList(),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  }

                  return widgets;
                })(),

              ),
            ],
          ),
        ),
      ),
    );
  }

  DataRow generateDataRow(SleepData entry) {
    return DataRow(
      cells: [
        entry.bedTime,
        entry.sleepLatency.toString(),
        entry.numAwakenings.toString(),
        entry.avgLengthOfAwakening.toString(),
        entry.wakeTime,
        entry.scoopsOfZenbev.toString(),
      ].map((value) => DataCell(Container(
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          border: Border.all(color: AppColors.buttonColor, width: 1.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
        child: Center(
          child: Text(
            value,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ))).toList(),
    );
  }

  DataColumn buildCustomDataColumn(String label) {
    return DataColumn(
      label: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          border: Border.all(color: AppColors.buttonColor, width: 1.0),
        ),
        padding: EdgeInsets.only(left: 20.0, right: 18.0, top: 3, bottom: 3),
        child: Text(
          label,
          style: TextStyle(),
        ),
      ),
    );
  }

  String _getFormattedDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('MMM dd, yyyy').format(date); // Customize the date format as needed
  }
}

