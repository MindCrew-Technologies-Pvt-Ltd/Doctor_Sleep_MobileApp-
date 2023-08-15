import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../constants/color.dart';
import '../constants/string.dart';
import '../database_helper.dart';
import 'sleep_data.dart';

class Graphs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SleepData>>(
      future: SleepDataDatabase().getSortedSleepDataByDate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Data is still loading
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // An error occurred while fetching data
          return Text('Error: ${snapshot.error}');
        } else {
          // Data fetched successfully
          List<SleepData> sortedSleepData = snapshot.data!;
          print("object=> ${sortedSleepData.toList()[0].toMap()}");
          return Scaffold(
            appBar: AppBar(
              title: Text(
                Strings.appbargraph,
              ),
              backgroundColor: AppColors.primaryColor,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GraphBox(
                      title: Strings.graph1title,
                      child: SleepLatencyScatterPlot(sortedSleepData),
                    ),
                    SizedBox(height: 20),
                    GraphBox(
                      title: Strings.graph2title,
                      child: SleepEfficiencyScatterPlot(sortedSleepData),
                    ),
                    SizedBox(height: 20),
                    GraphBox(
                      title: Strings.graph3title,
                      child: TSTAndTIBScatterPlot(sortedSleepData),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class GraphBox extends StatelessWidget {
  final String title;
  final Widget child;

  GraphBox({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class SleepLatencyScatterPlot extends StatelessWidget {
  final List<SleepData> sortedSleepData;

  SleepLatencyScatterPlot(this.sortedSleepData);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: sortedSleepData.map((data) {
                return FlSpot(data.id!.toDouble(), data.sleepLatency.toDouble());
              }).toList(),
              isCurved: true,
              dotData: FlDotData(show: true),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: true),
            bottomTitles: SideTitles(showTitles: true),
            topTitles: SideTitles(showTitles: false), // Add this line to hide top titles
            rightTitles: SideTitles(showTitles: false), // Add this line to hide right titles
          ),
        ),
      ),
    );
  }
}

class SleepEfficiencyScatterPlot extends StatelessWidget {
  final List<SleepData> sortedSleepData;

  SleepEfficiencyScatterPlot(this.sortedSleepData);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: sortedSleepData.map((data) {
                return FlSpot(data.id!.toDouble(), data.sleepEfficiency.toDouble());
              }).toList(),
              isCurved: true,
              dotData: FlDotData(show: true),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: true),
            bottomTitles: SideTitles(showTitles: true),
            topTitles: SideTitles(showTitles: false), // Add this line to hide top titles
            rightTitles: SideTitles(showTitles: false), // Add this line to hide right titles
          ),
        ),
      ),
    );
  }
}

class TSTAndTIBScatterPlot extends StatelessWidget {
  final List<SleepData> sortedSleepData;

  TSTAndTIBScatterPlot(this.sortedSleepData);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: sortedSleepData.map((data) {
                return FlSpot(data.id!.toDouble(), data.totalSleepTime.toDouble());
              }).toList(),
              isCurved: true,
              dotData: FlDotData(show: true),
            ),
            LineChartBarData(
              spots: sortedSleepData.map((data) {
                return FlSpot(data.id!.toDouble(), data.timeInBed.toDouble());
              }).toList(),
              isCurved: true,
              dotData: FlDotData(show: true),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: true),
            bottomTitles: SideTitles(showTitles: true),
            topTitles: SideTitles(showTitles: false), // Add this line to hide top titles
            rightTitles: SideTitles(showTitles: false), // Add this line to hide right titles
          ),
        ),
      ),
    );
  }
}
