class MyTime {
  final int hour;
  final int minute;

  MyTime({
    required this.hour,
    required this.minute,
  });
}

List<MyTime> timeReservation = [
  MyTime(hour: 8, minute: 0),
  MyTime(hour: 10, minute: 0),
  MyTime(hour: 13, minute: 0),
  MyTime(hour: 15, minute: 0),
  MyTime(hour: 17, minute: 0),
  MyTime(hour: 20, minute: 0),
];
