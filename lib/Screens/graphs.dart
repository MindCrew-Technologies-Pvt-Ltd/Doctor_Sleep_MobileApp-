/*
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../constants/color.dart';

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
          if (sortedSleepData.isEmpty) {
            return Center(
              child: Text('No Data Available',
                style: TextStyle(
                  fontSize: 20, // Adjust the font size as needed
                   // fontWeight: FontWeight.bold, // You can adjust the font weight
                  color: Colors.white, // You can adjust the color
                ),
              ),
            );
          }

          print("object=> ${sortedSleepData.toList()[0].toMap()}");
          return Scaffold(
            appBar: AppBar(
              title: Text(
                Strings.appbargraph(context),
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
                      title: Strings.graph1title(context),
                      child: SleepLatencyScatterPlot(sortedSleepData),
                    ),
                    SizedBox(height: 20),
                    GraphBox(
                      title: Strings.graph2title(context),
                      child: SleepEfficiencyScatterPlot(sortedSleepData),
                    ),
                    SizedBox(height: 20),
                    GraphBox(
                      title: Strings.graph3title(context),
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
                return FlSpot(data.id!.toDouble(), data.sleepLatency!.toDouble());
              }).toList(),
              isCurved: true,
              dotData: FlDotData(show: true),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: true),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: (value) {
                if (value % 1 == 0) {
                  return value.toString();
                }
                return '';
              },
            ),
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
          leftTitles: SideTitles(
    showTitles: true,
    reservedSize: 28),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: (value) {
                if (value % 1 == 0) {
                  return value.toString();
                }
                return '';
              },
            ),
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
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: (value) {
                if (value % 1 == 0) {
                  return value.toString();
                }
                return '';
              },
            ),
            topTitles: SideTitles(showTitles: false), // Add this line to hide top titles
            rightTitles: SideTitles(showTitles: false), // Add this line to hide right titles
          ),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../constants/color.dart';

import '../database_helper.dart';
import 'languages.dart';
import 'sleep_data.dart';

class Graphs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SleepData>>(
      future: SleepDataDatabase().getSortedSleepDataByDate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text(Languages.of(context)!.appbargraph),
              backgroundColor: AppColors.primaryColor,
              centerTitle: true,
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text(Languages.of(context)!.appbargraph),
              backgroundColor: AppColors.primaryColor,
              centerTitle: true,
            ),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          List<SleepData> sortedSleepData = snapshot.data!;
          if (sortedSleepData.length < 3 || sortedSleepData.isEmpty) {
            return Scaffold(
              appBar: AppBar(
                title: Text(Languages.of(context)!.appbargraph),
                backgroundColor: AppColors.primaryColor,
                centerTitle: true,
              ),
              body: Center(
                child: Text(
                  Languages.of(context)!.NoDataAvailable,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(Languages.of(context)!.appbargraph),
              backgroundColor: AppColors.primaryColor,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GraphBox(
                      title: Languages.of(context)!.graph1title,
                      child: SleepLatencyScatterPlot(sortedSleepData),
                    ),
                    SizedBox(height: 20),
                    GraphBox(
                      title: Languages.of(context)!.graph2title,
                      child: SleepEfficiencyScatterPlot(sortedSleepData),
                    ),
                    SizedBox(height: 20),
                    GraphBox(
                      title: Languages.of(context)!.graph3title,
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
    List<FlSpot> spots = sortedSleepData
        .where((data) =>
    data.id != null &&
        data.sleepLatency != null &&
        data.sleepLatency!.isFinite &&
        !data.sleepLatency!.isNaN)
        .map((data) =>
        FlSpot(data.id!.toDouble(), data.sleepLatency!.toDouble()))
        .toList();

    // Subtract the minimum x-axis value to start from zero
    double minXValue = spots.first.x;
    spots = spots.map((spot) {
      return FlSpot(spot.x - minXValue, spot.y);
    }).toList();
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.7,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  dotData: FlDotData(show: true),
                ),
              ],
              titlesData: FlTitlesData(
                leftTitles: SideTitles(showTitles: true),
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    if (value % 1 == 0) {
                      return (minXValue + value).toInt().toString(); // Use minXValue here
                    }
                    return '';
                  },
                ),
                topTitles: SideTitles(showTitles: false),
                rightTitles: SideTitles(showTitles: false),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(Languages.of(context)!.Days, style: TextStyle(fontSize: 18, color: Colors.black)),
      ],
    );
  }
}



class SleepEfficiencyScatterPlot extends StatelessWidget {
  final List<SleepData> sortedSleepData;

  SleepEfficiencyScatterPlot(this.sortedSleepData);

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = sortedSleepData
        .where((data) =>
    data.id != null &&
        data.sleepEfficiency != null &&
        data.sleepEfficiency!.isFinite)
        .map((data) =>
        FlSpot(data.id!.toDouble(), data.sleepEfficiency!.toDouble()))
        .toList();

    // Handle invalid values (NaN or infinite) by replacing them with a placeholder value
    spots = spots.map((spot) {
      if (spot.y.isNaN || spot.y.isInfinite) {
        return FlSpot(spot.x, 0); // Use 0 as a placeholder value
      }
      return spot;
    }).toList();

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.7,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  dotData: FlDotData(show: true),
                ),
              ],
              titlesData: FlTitlesData(
                leftTitles: SideTitles(showTitles: true, reservedSize: 28),
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    if (value % 1 == 0) {
                      return value.toInt().toString();
                    }
                    return '';
                  },
                ),
                topTitles: SideTitles(showTitles: false),
                rightTitles: SideTitles(showTitles: false),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(Languages.of(context)!.Days, style: TextStyle(fontSize: 18, color: Colors.black)),
      ],
    );
  }
}

class TSTAndTIBScatterPlot extends StatelessWidget {
  final List<SleepData> sortedSleepData;

  TSTAndTIBScatterPlot(this.sortedSleepData);

  @override
  Widget build(BuildContext context) {
    List<FlSpot> totalSleepTimeSpots = sortedSleepData
        .where((data) =>
    data.id != null &&
        data.totalSleepTime != null &&
        data.totalSleepTime!.isFinite &&
        !data.totalSleepTime!.isNaN)
        .map((data) =>
        FlSpot(data.id!.toDouble(), data.totalSleepTime!.toDouble()))
        .toList();

    List<FlSpot> timeInBedSpots = sortedSleepData
        .where((data) =>
    data.id != null &&
        data.timeInBed != null &&
        data.timeInBed!.isFinite &&
        !data.timeInBed!.isNaN)
        .map((data) =>
        FlSpot(data.id!.toDouble(), data.timeInBed!.toDouble()))
        .toList();

    // Handle invalid values (NaN or infinite) by replacing them with a placeholder value
    totalSleepTimeSpots = totalSleepTimeSpots.map((spot) {
      if (spot.y.isNaN || spot.y.isInfinite) {
        return FlSpot(spot.x, 0); // Use 0 as a placeholder value
      }
      return spot;
    }).toList();

    timeInBedSpots = timeInBedSpots.map((spot) {
      if (spot.y.isNaN || spot.y.isInfinite) {
        return FlSpot(spot.x, 0); // Use 0 as a placeholder value
      }
      return spot;
    }).toList();

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.7,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: totalSleepTimeSpots,
                  isCurved: true,
                  dotData: FlDotData(show: true),
                  colors: [Colors.red],
                ),
                LineChartBarData(
                  spots: timeInBedSpots,
                  isCurved: true,
                  dotData: FlDotData(show: true),
                ),
              ],
              titlesData: FlTitlesData(
                leftTitles: SideTitles(showTitles: true, reservedSize: 28),
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    if (value % 1 == 0) {
                      return value.toInt().toString();
                    }
                    return '';
                  },
                ),
                topTitles: SideTitles(showTitles: false),
                rightTitles: SideTitles(showTitles: false),
              ),
            ),
          ),

        ),
        const SizedBox(height: 10),
        Text(Languages.of(context)!.Days, style: TextStyle(fontSize: 18, color: Colors.black)),
      ],
    );
  }
}

