enum TimeFrame {
  hour('hour', 'Past hour'),
  sixhour('sixhour', 'Past six hours'),
  day('day', 'Past day'),
  week('week', 'Past week'),
  month('month', 'Past month'),
  year('year', 'Past year');

  final String apiString;
  final String display;
  const TimeFrame(this.apiString, this.display);
}
