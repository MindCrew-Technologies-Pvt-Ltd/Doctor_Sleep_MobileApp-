class SleepData {
  final int? id; // Make id optional since it's auto-incremented
  final String bedTime;
  final int sleepLatency;
  final int numAwakenings;
  final int avgLengthOfAwakening;
  final String wakeTime;
  final int scoopsOfZenbev;
  final String date;

  SleepData({
    this.id, // Make id optional since it's auto-incremented
    required this.bedTime,
    required this.sleepLatency,
    required this.numAwakenings,
    required this.avgLengthOfAwakening,
    required this.wakeTime,
    required this.scoopsOfZenbev,
    required this.date,
  });

  double get sleepEfficiency {
    return (totalSleepTime / timeInBed) * 100;
  }

  int get totalSleepTime {
    return timeInBed - sleepLatency - (numAwakenings * avgLengthOfAwakening);
  }

  int get timeInBed {
    int wakeTimeMinutes = _convertToMinutes(wakeTime);
    int bedTimeMinutes = _convertToMinutes(bedTime);

    if (wakeTimeMinutes < bedTimeMinutes) {
      wakeTimeMinutes += 24 * 60;
    }

    int timeInMinutes = wakeTimeMinutes - bedTimeMinutes;
    int minutePart = timeInMinutes % 60;
    int hourPart = timeInMinutes ~/ 60;

    return (hourPart * 60) + minutePart;
  }

  int _convertToMinutes(String time) {
    List<String> parts = time.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    return (hours * 60) + minutes;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bedTime': bedTime,
      'sleepLatency': sleepLatency,
      'numAwakenings': numAwakenings,
      'avgLengthOfAwakening': avgLengthOfAwakening,
      'wakeTime': wakeTime,
      'scoopsOfZenbev': scoopsOfZenbev,
      'date': date,
    };
  }

  factory SleepData.fromMap(Map<String, dynamic> map) {
    return SleepData(
      id: map['id'],
      bedTime: map['bedTime'],
      sleepLatency: map['sleepLatency'],
      numAwakenings: map['numAwakenings'],
      avgLengthOfAwakening: map['avgLengthOfAwakening'],
      wakeTime: map['wakeTime'],
      scoopsOfZenbev: map['scoopsOfZenbev'],
      date: map['date'],
    );
  }
}
