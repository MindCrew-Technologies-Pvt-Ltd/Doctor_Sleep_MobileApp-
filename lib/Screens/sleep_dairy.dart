import 'package:doctor_sleep/Screens/sleep_data.dart';
import 'package:doctor_sleep/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../constants/color.dart';
import 'languages.dart';

class SleepDataEntryScreen extends StatefulWidget {
  @override
  _SleepDataEntryScreenState createState() => _SleepDataEntryScreenState();
}

class _SleepDataEntryScreenState extends State<SleepDataEntryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<SleepEntry> sleepEntries = [];


  final SleepDataDatabase database = SleepDataDatabase();

  TextEditingController bedtimeController = TextEditingController();
  TextEditingController waketimeController = TextEditingController();
  TextEditingController sleepLatencyController = TextEditingController();
  TextEditingController numAwakeningsController = TextEditingController();
  TextEditingController avgLengthOfAwakeningController = TextEditingController();
  TextEditingController scoopsOfZenbevController = TextEditingController();
  TextEditingController selectedDateController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedBedTime = TimeOfDay.now();
  TimeOfDay selectedWakeTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();

    selectedDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(
        title: Text(Languages.of(context)!.sleepdiary),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDateSelectionFormField(context),
            buildTimePickerFormField(
              Languages.of(context)!.bedtime,
              selectedBedTime,
                  (time) {
                print("Selected Bed Time: $time");
                setState(() {
                  selectedBedTime = time;
                });
              },
              bedtimeController, // Pass the controller here
            ),
            buildTimePickerFormField(
              Languages.of(context)!.waketime,
              selectedWakeTime,
                  (time) {
                print("Selected wake Time: $time");
                setState(() {
                  selectedWakeTime = time;
                });
              },
              waketimeController, // Pass the controller here
            ),

            buildTextField(sleepLatencyController, Languages.of(context)!.timetofallasleep),
            buildTextField(numAwakeningsController, Languages.of(context)!.numberofawakenings),
            buildTextField(avgLengthOfAwakeningController, Languages.of(context)!.averagelengthofawakenings),
            buildTextField(scoopsOfZenbevController, Languages.of(context)!.scoopsofzenbev),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showResetConfirmationDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor, // Change this color to your desired color
                  ),
                  child: Text(Languages.of(context)!.ResetData),
                ),

                ElevatedButton(
                  onPressed: () async {   // Check if any of the text fields are empty
                    if (bedtimeController.text.isEmpty ||
                        waketimeController.text.isEmpty ||
                        sleepLatencyController.text.isEmpty ||
                        numAwakeningsController.text.isEmpty ||
                        avgLengthOfAwakeningController.text.isEmpty ||
                        scoopsOfZenbevController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(Languages.of(context)!.Error),
                            content: Text(Languages.of(context)!.PleaseEntertheData),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                child: Text(Languages.of(context)!.Ok),
                              ),
                            ],
                          );
                        },
                      );
                      return; // Stop further processing
                    }

                    final String selectedDateFormatted = DateFormat('yyyy-MM-dd').format(selectedDate);
                    final bool dateExists = await database.isDateAlreadyExists(selectedDateFormatted);

                    if (dateExists) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(Languages.of(context)!.Error),
                            content: Text(Languages.of(context)!.CannotInsertSameDateDataAgain),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      return; // Stop further processing
                    }


                    final sleepData = SleepData(
                      bedTime: '${selectedBedTime.hour}:${selectedBedTime.minute}',
                      wakeTime: '${selectedWakeTime.hour}:${selectedWakeTime.minute}',
                      sleepLatency: int.parse(sleepLatencyController.text),
                      numAwakenings: int.parse(numAwakeningsController.text),
                      avgLengthOfAwakening: int.parse(avgLengthOfAwakeningController.text),
                      scoopsOfZenbev: int.parse(scoopsOfZenbevController.text),
                      date: DateFormat('yyyy-MM-dd').format(selectedDate),
                    );

                    // Add the sleep data to the list
                    setState(() {
                      sleepEntries.add(SleepEntry(
                          date: sleepData.date,
                          bedTime: sleepData.bedTime,
                          wakeTime: sleepData.wakeTime,
                          timeTakenToFallAsleep: sleepData.sleepLatency,
                      ));
                  });

                    await database.insertSleepData(sleepData);


                    setState(() {
                      selectedDate = DateTime.now();
                      selectedBedTime = TimeOfDay.now();
                      selectedWakeTime = TimeOfDay.now();
                      selectedDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                      sleepLatencyController.clear();
                      numAwakeningsController.clear();
                      avgLengthOfAwakeningController.clear();
                      scoopsOfZenbevController.clear();
                    });
                    // Show a success SnackBar
                    // Show a success SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(Languages.of(context)!.DataSavedSuccessfully),
                        duration: Duration(seconds: 2), // You can adjust the duration as needed
                      ),
                    );
    },


                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor, // Change this color to your desired color
                  ),
                  child: Text(Languages.of(context)!.SaveData),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDateSelectionFormField(BuildContext context) {
    return TextFormField(
      controller: selectedDateController,
      readOnly: true,
      onTap: () {
        _selectDate(context);
      },
      decoration: InputDecoration(
        labelText: Languages.of(context)!.selecteddate,
        labelStyle: TextStyle(color: AppColors.primaryColor), // Change label text color
        suffixIcon: IconButton(
          onPressed: () {
            _selectDate(context);
          },
          icon: Icon(Icons.calendar_today, color: AppColors.primaryColor), // Change icon color
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor), // Change focused border color
        ),
      ),
    );
  }

  Widget buildTimePickerFormField(String label, TimeOfDay time, ValueChanged<TimeOfDay> onChanged, TextEditingController controller) {
    return GestureDetector(
      onTap: () {
        _selectTime(context, time, onChanged, controller);
      },
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: AppColors.primaryColor), // Change label text color
            suffixIcon: IconButton(
              onPressed: () {
                _selectTime(context, time, onChanged, controller);
              },
              icon: Icon(Icons.access_time, color: AppColors.primaryColor), // Change icon color
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor), // Change focused border color
            ),
          ),
          controller: controller,
          readOnly: true,
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label) {
    final inputFormatter = FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$'));

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.primaryColor),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [inputFormatter],
    );
  }


  void _showResetConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Languages.of(context)!.ResetData),
          content: Text(Languages.of(context)!.Areyousureyouwanttodeleteallsaveddata),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(Languages.of(context)!.No),
            ),
            TextButton(
              onPressed: () async {
                await database.resetData(); // Reset the data in the database
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(Languages.of(context)!.Yes),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime minDate = currentDate.subtract(Duration(days: 1)); // Allow current date
    final DateTime maxDate = currentDate.add(Duration(days: 90));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: currentDate, // Set minDate to currentDate
      lastDate: maxDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor, // Change the primary color of the date picker
            // accentColor: AppColors.primaryColor, // Change the accent color of the date picker
            colorScheme: ColorScheme.light(primary: AppColors.primaryColor), // Change the color scheme
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary), // Adjust button colors
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        selectedDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }




  Future<void> _selectTime(BuildContext context, TimeOfDay currentTime, ValueChanged<TimeOfDay> onChanged, TextEditingController controller) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor, // Change the primary color of the time picker
            // accentColor: AppColors.primaryColor, // Change the accent color of the time picker
            colorScheme: ColorScheme.light(primary: AppColors.primaryColor), // Change the color scheme
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary), // Adjust button colors
          ),
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      print("Selected Time: $selectedTime");
      onChanged(selectedTime);

      // Update the text field value
      final formattedTime = selectedTime.format(context);
      controller.text = formattedTime;
    }
  }


}

class SleepEntry {
  final String date;
  final String bedTime;
  final String wakeTime;
  final int timeTakenToFallAsleep;

  SleepEntry({
    required this.date,
    required this.bedTime,
    required this.wakeTime,
    required this.timeTakenToFallAsleep,
  });
}

