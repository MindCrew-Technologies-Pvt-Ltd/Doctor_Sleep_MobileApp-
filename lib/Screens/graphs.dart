import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../constants/color.dart';

class Graphs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Summary Graph',
        ),
        backgroundColor: AppColors.primaryColor, // Replace with your preferred color
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GraphBox(
                title: 'Sleep Latency',
                child: SleepLatencyScatterPlot(),
              ),
              SizedBox(height: 20),
              GraphBox(
                title: 'Sleep Efficiency',
                child: SleepEfficiencyScatterPlot(),
              ),
              SizedBox(height: 20),
              GraphBox(
                title: 'TST and TIB',
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
    // Replace this data with your actual data for sleep latency
    List<FlSpot> sleepLatencyData = [
      FlSpot(1, 6),
      FlSpot(2, 7),
      FlSpot(3, 8),
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
              // Add more configurations as needed for labels, axes, etc.
            ),
          ],
        ),
      ),
    );
  }
}

class SleepEfficiencyScatterPlot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this data with your actual data for sleep efficiency
    List<FlSpot> sleepEfficiencyData = [
      FlSpot(1, 85),
      FlSpot(2, 90),
      FlSpot(3, 80),
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
              // Add more configurations as needed for labels, axes, etc.
            ),
          ],
        ),
      ),
    );
  }
}

class TSTAndTIBScatterPlot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this data with your actual data for TST and TIB
    List<FlSpot> tstData = [
      FlSpot(1, 7),
      FlSpot(2, 7.5),
      FlSpot(3, 8),
      // Add more data points as needed
    ];

    List<FlSpot> tibData = [
      FlSpot(1, 8),
      FlSpot(2, 8.5),
      FlSpot(3, 9),
      // Add more data points as needed
    ];

    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 0), // Dummy spot to avoid rendering at index 0
                ...tstData,
              ],
              isCurved: true,
              dotData: FlDotData(show: true),
              // Add more configurations as needed for labels, axes, etc.
            ),
            LineChartBarData(
              spots: [
                FlSpot(0, 0), // Dummy spot to avoid rendering at index 0
                ...tibData,
              ],
              isCurved: true,
              dotData: FlDotData(show: true),
              // Add more configurations as needed for labels, axes, etc.
            ),
          ],
        ),
      ),
    );
  }
}

