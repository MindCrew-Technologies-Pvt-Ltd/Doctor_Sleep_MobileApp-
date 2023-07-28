// import 'package:flutter/material.dart';
//
// import '../constants/color.dart';
// import '../constants/string.dart';
//
// class SleepDiary extends StatefulWidget {
//   @override
//   _SleepDiaryState createState() => _SleepDiaryState();
// }
//
// class _SleepDiaryState extends State<SleepDiary> {
//   @override
//   Widget build(BuildContext context) {
//     List<DataColumn> customColumns =[
//       DataColumn(label: Text('28 Jul.')),
//       DataColumn(label: Text('28 Jul.')),
//       DataColumn(label: Text('28 Jul.')),
//       DataColumn(label: Text('28 Jul.')),
//       DataColumn(label: Text('28 Jul.')),
//       DataColumn(label: Text('28 Jul.')),
//       DataColumn(label: Text('28 Jul.')),
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sleep Diary App Bar'),
//         backgroundColor: AppColors.primaryColor,
//         centerTitle: true, // Add any other app bar customization as needed
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(12.0),
//           child: Column(
//             children: [
//               Container(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Icon(Icons.info_outlined, size: 20),
//                     // Icon inside the container
//                     Text(
//                     Strings.sleepdiarytime,
//                       style: TextStyle(
//                         fontSize: 15,
//                       ),
//                     ),
//                   ],
//                 ),
//                 padding: const EdgeInsets.all(9.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                 ),
//               ),
//               SizedBox(height: 24), // Add spacing between the two rows
//               Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.add_circle_outline_outlined, size: 40),
//                     onPressed: () {
//                       // Add your icon's onPressed logic here
//                       // This function will be executed when the icon is pressed.
//                     },
//                   ),
//                   SizedBox(width: 15),
//                   Text(
//                    Strings.register,
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                   SizedBox(width: 20),
//                   // Add spacing between the "Register" text and the button
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add your button's onPressed logic here
//                     },
//                     child: Text(
//                       'Save Data',
//                       style: TextStyle(fontSize: 10),
//                     ),
//                     style: ButtonStyle(
//                       backgroundColor:
//                       MaterialStateProperty.all<Color>(AppColors.accentColor), // Replace with your desired color
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 2), // Add spacing between the previous content and the scrollable container
//               _buildSleepDataContainer(),
//               SizedBox(height: 20), // Add spacing between the scrollable container and the next content
//             ],
//           ),
//         ),
//       ),
//       // Align to position the "Average Values" container at the bottom center
//       floatingActionButton: Align(
//         alignment: Alignment.bottomCenter,
//         child: Container(
//           margin: EdgeInsets.only(bottom: 30), // Adjust the margin as per your requirement
//           padding: EdgeInsets.all(5),
//           color: AppColors.averageColor, // Replace with your desired color
//           child: Text(
//             'Average Values',
//             style: TextStyle(
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSleepDataContainer() {
//     return Container(
//       height: 350, // Set the desired height of the container
//       child: Column(
//         children: [
//           Container(
//              padding: EdgeInsets.only(left:30,right:30), // Add padding to the text
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black, width: 1), // Add a border
//               color: AppColors.primaryColor // Set the color inside the border
//             ),
//             child: Text(
//               'Week 1',
//               style: TextStyle(
//                 fontSize: 18,
//                 // fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 DataTable(
//                   columnSpacing: 10,
//
//             columns: [
//               buildCustomDataColumn('28.Jul.', AppColors.buttonColor),
//               buildCustomDataColumn('29.Jul.', AppColors.buttonColor),
//               buildCustomDataColumn('30.Jul.', AppColors.buttonColor),
//               buildCustomDataColumn('31.Jul.', AppColors.buttonColor),
//               buildCustomDataColumn('01.Jul.', AppColors.buttonColor),
//               buildCustomDataColumn('02.Jul.', AppColors.buttonColor),
//               buildCustomDataColumn('03.Jul.', AppColors.buttonColor),
//         ],
//
//         rows: [
//           DataRow(cells: [
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//           ],),
//           DataRow(cells: [
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//           ]),
//           DataRow(cells: [
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//           ]),
//           DataRow(cells: [
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//           ]),
//           DataRow(cells: [
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//           ]),
//           DataRow(cells: [
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//             DataCell(_buildRoundedTextField('')),
//           ]),
//         ],
//       ),
//
//                   // dividerThickness: 0.0, //
//                   // columnSpacing: 2, // Add spacing between columns
//                   // columns: [
//                   //   DataColumn(label: Text('')), // Empty cell at row 1, column 1
//                   //   ...List.generate(7, (index) => DataColumn(label: Text('Col $index'))),
//                   // ],
//                   // rows: List.generate(7, (index) {
//                   //   return DataRow(
//                   //     cells: [
//                   //       DataCell(Text('Row $index')),
//                   //       ...List.generate(7, (colIndex) => DataCell(Text('Data $index-$colIndex'))),
//                   //     ],
//                   //   );
//                   // }),
//       ]
//                 ),
//           )
//               ],
//             ),
//           );
//
//   }
//   DataColumn buildCustomDataColumn(String label, Color backgroundColor) {
//     return DataColumn(
//       label: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           border: Border.all(color: AppColors.buttonColor, width: 1.0),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.black, // You can customize the text color here
//             // fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildRoundedTextField(String initialValue) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         border: Border.all(color: Colors.grey),
//       ),
//       child: TextField(
//         controller: TextEditingController(text: initialValue),
//         decoration: InputDecoration(
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }
//
//
import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/string.dart';

class SleepDiary extends StatefulWidget {
  @override
  _SleepDiaryState createState() => _SleepDiaryState();
}

class _SleepDiaryState extends State<SleepDiary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Diary App Bar'),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.info_outlined, size: 20),
                    Text(
                      Strings.sleepdiarytime,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(9.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add_circle_outline_outlined, size: 40),
                    onPressed: () {
                      // Add your icon's onPressed logic here
                      // This function will be executed when the icon is pressed.
                    },
                  ),
                  SizedBox(width: 15),
                  Text(
                    Strings.register,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add your button's onPressed logic here
                    },
                    child: Text(
                      'Save Data',
                      style: TextStyle(fontSize: 10),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.accentColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              _buildSleepDataContainer(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildSleepDataContainer() {
    return Container(
      height: 350,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              color: AppColors.primaryColor,
            ),
            child: Text(
              'Week 1',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 1.0),
                child: buildSleepDataTable(),
              ),
            ),
          ),
          SizedBox(height: 20), // Add spacing between the DataTable and the text container
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(8),
              color: AppColors.averageColor, // Replace with your desired color
              child: Text(
                'Average Values',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black, // Replace with your desired text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildSleepDataTable() {

    return DataTable(
      dataRowHeight: 35.0,
      columnSpacing: 10,
      columns: [
        buildCustomDataColumn('', AppColors.waste),
        buildCustomDataColumn('28.Jul.', AppColors.buttonColor),
        buildCustomDataColumn('29.Jul.', AppColors.buttonColor),
        buildCustomDataColumn('30.Jul.', AppColors.buttonColor),
        buildCustomDataColumn('31.Jul.', AppColors.buttonColor),
        buildCustomDataColumn('01.Jul.', AppColors.buttonColor),
        buildCustomDataColumn('02.Jul.', AppColors.buttonColor),
        buildCustomDataColumn('03.Jul.', AppColors.buttonColor),
      ],
      rows: [
        DataRow(cells: [
          DataCell(_buildRoundedTextField('Bed Time ')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
        ]),
        DataRow(cells: [
          DataCell(_buildRoundedTextField('Sleep Latency')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
        ]),
        DataRow(cells: [
          DataCell(_buildRoundedTextField('Number of Awakenings')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
        ]),
        DataRow(cells: [
          DataCell(_buildRoundedTextField('Average Length of Awakening')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
        ]),
        DataRow(cells: [
          DataCell(_buildRoundedTextField('Wake Time')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
        ]),
        DataRow(cells: [
          DataCell(_buildRoundedTextField('Scoops of Zenbev')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
          DataCell(_buildRoundedTextField('')),
        ]),


      ],
    );
  }

  DataColumn buildCustomDataColumn(String label, Color backgroundColor) {
    return DataColumn(
      label: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: AppColors.buttonColor, width: 0.0),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedTextField(String initialValue) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
      ),
      child: TextField(
        controller: TextEditingController(text: initialValue),
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
