import 'package:doctor_sleep/Screens/sleep_dairy.dart';
import 'package:doctor_sleep/Screens/sleepdiary.dart';
import 'package:doctor_sleep/Screens/weekelysummary.dart';
import 'package:doctor_sleep/constants/color.dart';
import 'package:flutter/material.dart';
import '../constants/string.dart';
import 'acknowledgement.dart';
import 'graphs.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.Homepage),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 30.0,
            child: Container(
              padding: EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: AppColors.primaryColor,
              ),
              child: Text(
                Strings.cal,
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
            ),
          ),
          Positioned(
            top: 120.0,
            left: 30,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.Modernize,
                    style: TextStyle(),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20), // Add spacing between the text and circular containers
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircularContainerWithNumber(number: '1', text: Strings.tap1),
                      SizedBox(height: 15), // Add spacing between the circular containers
                      CircularContainerWithNumber(number: '2', text: Strings.tap2),
                      SizedBox(height: 15),
                      CircularContainerWithNumber(number: '3', text: Strings.tap3),
                    ],
                  ),
                  SizedBox(height: 30), // Add spacing between circular container 3 and the button
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SleepDataEntryScreen()),
                          );
                        },
                        child: Text(Strings.sleepdiary),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.secondaryColor),
                        ),
                      ),
                      SizedBox(width: 26), // Add spacing between Sleep Diary button and the new button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SleepDataEntryScreen()),
                          );// Add functionality for the new button
                        },
                        child: Text(Strings.button2),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.secondaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,), // Add spacing between the new button and the row of new buttons
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Graphs()),
                          );// Add functionality for New Button 2
                        },
                        child: Text(Strings.button3),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.secondaryColor),
                        ),
                      ),
                      SizedBox(width: 20), // Add spacing between New Button 2 and New Button 3
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Acknowledgement()),
                          );
                        },
                        child: Text(Strings.button4),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.secondaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






class CircularContainerWithNumber extends StatelessWidget {
  final String number;
  final String text;

  CircularContainerWithNumber({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.buttonColor,
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
        ),
        SizedBox(width: 17), // Add spacing between the circular container and the text
        Text(text, style: TextStyle(fontSize: 17)),
      ],
    );
  }
}
