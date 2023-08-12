class SleepData {
  int? id;
  int weekNumber;
  String bedTime;
  String sleepLatency;
  int numberOfAwakenings;
  int averageLengthAwakening;
  String wakeTime;
  int scoopsZenbev;
  String sleepDate;


  SleepData({
    this.id,
    required this.weekNumber,
    required this.bedTime,
    required this.sleepLatency,
    required this.numberOfAwakenings,
    required this.averageLengthAwakening,
    required this.wakeTime,
    required this.scoopsZenbev,
    required this.sleepDate,
  });



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'week_number': weekNumber,
      'bed_time': bedTime,
      'sleep_latency': sleepLatency,
      'number_of_awakenings': numberOfAwakenings,
      'average_length_awakening': averageLengthAwakening,
      'wake_time': wakeTime,
      'scoops_zenbev': scoopsZenbev,
      'sleep_date': sleepDate,
    };
  }

  factory SleepData.fromMap(Map<String, dynamic> map) {
    return SleepData(
      id: map['id'],
      weekNumber: map['week_number'],
      bedTime: map['bed_time'],
      sleepLatency: map['sleep_latency'],
      numberOfAwakenings: map['number_of_awakenings'], // Convert to string
      averageLengthAwakening: map['average_length_awakening'],
      wakeTime: map['wake_time'],
      scoopsZenbev: map['scoops_zenbev'],
      sleepDate: map['sleep_date'],
    );
  }


}
