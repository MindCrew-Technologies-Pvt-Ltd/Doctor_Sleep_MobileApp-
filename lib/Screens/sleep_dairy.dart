import 'package:doctor_sleep/Screens/sleep_data.dart';
import 'package:doctor_sleep/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SleepDataEntryScreen extends StatefulWidget {
  @override
  _SleepDataEntryScreenState createState() => _SleepDataEntryScreenState();
}

class _SleepDataEntryScreenState extends State<SleepDataEntryScreen> {
  final SleepDataDatabase database = SleepDataDatabase();

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
                setState(() {
                  selectedBedTime = time;
                });
              },
            ),
            buildTimePickerFormField(
              'Wake Time',
              selectedWakeTime,
                  (time) {
                setState(() {
                  selectedWakeTime = time;
                });
              },
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
                  child: Text('Reset Data'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final sleepData = SleepData(
                      bedTime: selectedBedTime.format(context),
                      wakeTime: selectedWakeTime.format(context),
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

  Widget buildTimePickerFormField(String label, TimeOfDay time, ValueChanged<TimeOfDay> onChanged) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          onPressed: () {
            _selectTime(context, time, onChanged);
          },
          icon: Icon(Icons.access_time),
        ),
      ),
      initialValue: time.format(context),
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
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        selectedDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context, TimeOfDay currentTime, ValueChanged<TimeOfDay> onChanged) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true), // Force 24-hour format
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      onChanged(selectedTime);
    }
  }

}
