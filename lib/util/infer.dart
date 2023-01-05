DateTime inferDate(DateTime dateSent, int hour, int minute) {
  DateTime date =
      DateTime(dateSent.year, dateSent.month, dateSent.day, hour, minute);

  if (dateSent.difference(date).inMinutes < -5) {
    date = date.subtract(const Duration(days: 1));
  }
  return date;
}
