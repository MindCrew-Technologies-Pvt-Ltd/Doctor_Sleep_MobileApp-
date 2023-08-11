import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../constants/color.dart';
import '../constants/string.dart';

class Graphs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: SleepLatencyScatterPlot(),
              ),
              SizedBox(height: 20),

              GraphBox(
                title: Strings.graph2title,
                child: SleepEfficiencyScatterPlot(),
              ),
              SizedBox(height: 20),
              GraphBox(
                title: Strings.graph3title,
                child: TSTAndTIBScatterPlot(),
              ),
            ],
          ),
        ),
      ),
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
  @override
  Widget build(BuildContext context) {
    List<FlSpot> sleepLatencyData = [
      FlSpot(1, 360), // 1 week = 360 minutes
      FlSpot(2, 420), // 2 weeks = 420 minutes
      FlSpot(3, 480), // 3 weeks = 480 minutes
      FlSpot(4, 540), // 4 weeks = 540 minutes
      // Add more data points as needed
    ];

    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: sleepLatencyData,
              isCurved: true,
              dotData: FlDotData(show: true),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: true),
            bottomTitles: SideTitles(showTitles: true,),

          ),
        ),
      ),
    );
}
}

class SleepEfficiencyScatterPlot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<FlSpot> sleepEfficiencyData = [
      FlSpot(1, 85),
      FlSpot(2, 90),
      FlSpot(3, 80),
      FlSpot(4, 75),

      // Add more data points as needed
    ];

    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: sleepEfficiencyData,
              isCurved: true,
              dotData: FlDotData(show: true),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: true),
            bottomTitles: SideTitles(showTitles: true),
          ),
        ),
      ),
    );
  }
}

class TSTAndTIBScatterPlot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<FlSpot> tstData = [
      FlSpot(1, 420), // 1 week = 420 minutes
      FlSpot(2, 450), // 2 weeks = 450 minutes
      FlSpot(3, 480), // 3 weeks = 480 minutes
      FlSpot(4, 510), // 4 weeks = 510 minutes

      // Add more data points as needed
    ];

    List<FlSpot> tibData = [
      FlSpot(1, 480), // 1 week = 480 minutes
      FlSpot(2, 510), // 2 weeks = 510 minutes
      FlSpot(3, 540), // 3 weeks = 540 minutes
      FlSpot(4, 570), // 4 weeks = 570 minutes
      // Add more data points as needed
    ];

    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: [FlSpot(0, 0), ...tstData],
              isCurved: true,
              dotData: FlDotData(show: true),
            ),
            LineChartBarData(
              spots: [FlSpot(0, 0), ...tibData],
              isCurved: true,
              dotData: FlDotData(show: true),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: true),
            bottomTitles: SideTitles(showTitles: true),
          ),
        ),
      ),
    );
  }
}
