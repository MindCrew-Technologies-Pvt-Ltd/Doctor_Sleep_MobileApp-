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
  // A list of supported languages
  final List<String> languages = ['English', 'Deutsch', 'danisch', 'Franzosisch'];

  // Function to show the language selection dialog
  void showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose your language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (String language in languages)
                ListTile(
                  title: Text(language),
                  onTap: () {
                    // Close the dialog and navigate to the HomeScreen with the selected language
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
      appBar: AppBar(
        title: Text(
          Strings.appbar,
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the language selection dialog when the button is pressed
            showLanguageDialog(context);
          },
          child: Text(Strings.buttonmessage),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                AppColors.secondaryColor), // Change the button color here
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FullScreenImage(),
//     );
//   }
// }
//
// class FullScreenImage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             child: Image.asset(
//               'assets/images/doctorsleepfront.jpeg', // Replace 'your_image.png' with the path to your image asset
//               fit: BoxFit.cover,
//             ),
//           ),
//           Center(
//             child: Text(
//               'Your Text Here', // Replace with the desired text
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: EdgeInsets.only(bottom: 16.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Add button action here
//                 },
//                 child: Text('Button Text'), // Replace with the desired button text
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//








// class HomeScreen extends StatelessWidget {
//   final String language;
//
//   HomeScreen({required this.language});
//
//   @override
//   Widget build(BuildContext context) {
//     // You can use the selected language here in the HomeScreen widget
//     // For example, you can display localized content based on the selected language.
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
//       ),
//       body: Center(
//         child: Text('Selected Language: $language'),
//       ),
//     );
//   }
// }
