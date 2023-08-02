import 'package:doctor_sleep/constants/color.dart';
import 'package:flutter/material.dart';
import 'Screens/home.dart';
import 'constants/string.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CenteredButtonPage(),
    );
  }
}

class CenteredButtonPage extends StatelessWidget {
  final List<String> languages = ['English', 'Deutsch', 'Dansk', 'Français'];

  void showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose Your Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (String language in languages)
                ListTile(
                  title: Text(language),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/doctorsleepfront.jpeg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 110,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/zenbev.png',
                  width: 270,
                  height: 70,
                ),
                SizedBox(height: 180),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.gbutton, AppColors.frontbutton],
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: RawMaterialButton(
                    onPressed: () {
                      showLanguageDialog(context);
                    },
                    elevation: 5.0,
                    padding: EdgeInsets.only(left: 30, right: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Language',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 225,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sleep Calculator',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.doctordev,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    'Doctor-Developed',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 25, // Adjust the top position as needed to place the new image
            right: 2,
            child: IconButton(
              icon: Icon(
                Icons.mail_outline_outlined,
                color: Colors.black,
                size: 32,
              ),
              onPressed: () {
                // Add functionality for when the mail icon is pressed
              },
            ),
          ),
          Positioned(
            bottom: 412, // Adjust the top position as needed to place the new image
            left: 20,
            right: 0,
            child: Image.asset(
              'assets/images/biosential.png', // Replace with the path to your new image
              width: 200, // Adjust the width as needed
              height: 70,
            ),
          ),
        ],
      ),
    );
  }
}
