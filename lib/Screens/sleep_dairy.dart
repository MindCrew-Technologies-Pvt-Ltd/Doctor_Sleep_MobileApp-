import 'package:doctor_sleep/Screens/sleep_data.dart';
import 'package:doctor_sleep/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/color.dart';

class SleepDataEntryScreen extends StatefulWidget {
  @override
  _SleepDataEntryScreenState createState() => _SleepDataEntryScreenState();
}

class _SleepDataEntryScreenState extends State<SleepDataEntryScreen> {

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
      appBar: AppBar(
        title: Text('Sleep Data Entry'),
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
              'Bed Time',
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
              'Wake Time',
              selectedWakeTime,
                  (time) {
                print("Selected wake Time: $time");
                setState(() {
                  selectedWakeTime = time;
                });
              },
              waketimeController, // Pass the controller here
            ),

            buildTextField(sleepLatencyController, 'Sleep Latency (minutes)'),
            buildTextField(numAwakeningsController, 'Number of Awakenings'),
            buildTextField(avgLengthOfAwakeningController, 'Average Length of Awakening (minutes)'),
            buildTextField(scoopsOfZenbevController, 'Scoops of Zenbev'),
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
                  child: Text('Reset Data'),
                ),

                ElevatedButton(
                  onPressed: () async {
                    final String selectedDateFormatted = DateFormat('yyyy-MM-dd').format(selectedDate);
                    final bool dateExists = await database.isDateAlreadyExists(selectedDateFormatted);

                    if (dateExists) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Cannot insert same date data again.'),
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
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor, // Change this color to your desired color
                  ),
                  child: Text('Save Data'),
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
        labelText: 'Selected Date',
        suffixIcon: IconButton(
          onPressed: () {
            _selectDate(context);
          },
          icon: Icon(Icons.calendar_today),
        ),
      ),
    );
  }

  Widget buildTimePickerFormField(String label, TimeOfDay time, ValueChanged<TimeOfDay> onChanged, TextEditingController controller) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          onPressed: () {
            _selectTime(context, time, onChanged, controller); // Pass the controller here
          },
          icon: Icon(Icons.access_time),
        ),
      ),
      controller: controller, // Bind the controller
      readOnly: true,
    );
  }


  Widget buildTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
    );
  }

  void _showResetConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset Data'),
          content: Text('Are you sure you want to delete all saved data?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () async {
                await database.resetData(); // Reset the data in the database
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Yes'),
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
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false), // Force 24-hour format
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
