import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/string.dart';
import '../database_helper.dart';
import 'SleepData.dart';

class WeekelySheet extends StatefulWidget {
  @override




  State<StatefulWidget> createState() {
    return _WeekelySheetState();
  }
}

class _WeekelySheetState extends State<WeekelySheet> {
  DatabaseHelper dbHelper = DatabaseHelper();
  List<SleepData> sleepDataList = [];
  Map<int, List<SleepData>> groupedData = {};

  @override
  void initState() {
    super.initState();
    _loadSleepData();

  }

  _loadSleepData() async {
    List<SleepData> dataList = await dbHelper.getAllSleepData();
    groupedData = groupSleepDataByWeek(dataList);

    setState(() {
      sleepDataList = dataList;
    });
  }

  Map<int, List<SleepData>> groupSleepDataByWeek(List<SleepData> dataList) {
    Map<int, List<SleepData>> result = {};

    for (var sleepData in dataList) {
      if (!result.containsKey(sleepData.weekNumber)) {
        result[sleepData.weekNumber] = [];
      }
      result[sleepData.weekNumber]!.add(sleepData);
    }

    return result;
  }

  Map<String, String> calculateWeeklyAverages(List<SleepData> weekData) {
    if (weekData.isEmpty) return {};

    double totalBedTime = 0;
    double totalSleepLatencyInMinutes = 0;
    int totalNumberOfAwakenings = 0;
    int totalAverageLengthAwakening = 0;
    double totalWakeTime = 0;
    int totalScoopsZenbev = 0;
    // Calculate other fields as needed

    for (var entry in weekData) {
      totalBedTime += convertTimeToMinutes(entry.bedTime);
      totalSleepLatencyInMinutes += convertTimeToMinutes(entry.sleepLatency);
      totalNumberOfAwakenings += entry.numberOfAwakenings;
      totalAverageLengthAwakening += entry.averageLengthAwakening;
      totalWakeTime += convertTimeToMinutes(entry.wakeTime);
      totalScoopsZenbev += entry.scoopsZenbev;
      // Add other fields' calculations
    }

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
                Strings.textss,
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
                    rows: sleepDataList.map((sleepData) {
                      if (sleepData.weekNumber == 1) {
                        Map<String, String> weeklyAverages = calculateWeeklyAverages(groupedData[sleepData.weekNumber] ?? []);

                        return DataRow(
                          cells: [
                            DataCell(Text(weeklyAverages['bedTime']!)),
                            DataCell(Text(weeklyAverages['sleepLatency']!)),
                            DataCell(Text(weeklyAverages['numberOfAwakenings']!)),
                            DataCell(Text(weeklyAverages['averageLengthAwakening']!)),
                            DataCell(Text(weeklyAverages['wakeTime']!)),
                            DataCell(Text(weeklyAverages['scoopsZenbev']!)),
                          ],
                        );
                      } else {
                        return DataRow(cells: []); // Return an empty DataRow for other weeks
                      }
                    }).toList(),
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