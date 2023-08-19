import 'package:flutter/material.dart';

import '../constants/color.dart';
import 'languages.dart';


class Acknowledgement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AcknowledgementState();
  }
}

class _AcknowledgementState extends State<Acknowledgement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Languages.of(context)!.appbarA),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 80), // Add some top padding here
        child: ListView(
          children: [
            Center(
              child: Text(
                Languages.of(context)!.citation,
                style: TextStyle(
                  fontSize: 24,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20), // Add spacing between the texts
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20), // Add left and right padding
                child: Text(Languages.of(context)!.textcitation,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Add more widgets if needed
          ],
        ),
      ),
    );
  }
}
