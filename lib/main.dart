import 'package:doctor_sleep/constants/color.dart';
import 'package:flutter/material.dart';
import 'Screens/home.dart';
import 'constants/string.dart';
import 'package:url_launcher/url_launcher.dart';


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
          title: Text(Strings.buttonmessage),
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
            top: 0.15 * MediaQuery.of(context).size.height,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/zenbev.png',
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 80,
                ),
                SizedBox(height: 0.31 * MediaQuery.of(context).size.height),
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
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          Strings.language,
                          style: TextStyle(
                            fontSize: 0.04 * MediaQuery.of(context).size.height,
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
            top: 0.3 * MediaQuery.of(context).size.height,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Strings.title,
                  style: TextStyle(
                    fontSize: 0.05 * MediaQuery.of(context).size.height,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.doctordev,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    Strings.docdev,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 0.03 * MediaQuery.of(context).size.height,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 0.05 * MediaQuery.of(context).size.height,
            right: 0.03 * MediaQuery.of(context).size.width,
            child: IconButton(
              icon: Icon(
                Icons.mail_outline_outlined,
                color: Colors.black,
                size: 0.04 * MediaQuery.of(context).size.height,
              ),
              onPressed: () {
                launch('mailto:info@zenbev.com');
              },
            ),

          ),
          Positioned(
            top: 0.215 * MediaQuery.of(context).size.height,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/biosential.png',
              width: 0.5 * MediaQuery.of(context).size.width,
              height: 70,
            ),
          ),
        ],
      ),
    );
  }
}
