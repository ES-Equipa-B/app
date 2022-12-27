import 'package:app_sys_eng/models/reading.dart';

class ReadingList {
  List<Reading> _readings = [];
  Reading _max = Reading();
  Reading _min = Reading();
  Reading _avg = Reading();

  ReadingList.fromJson(Map<String, dynamic> json) {
    Iterable<dynamic> jReadings = json['readings'];

    _readings = jReadings.map((e) => Reading.fromJson(e)).toList();
    _max = Reading.fromJson(json['max']);
    _min = Reading.fromJson(json['min']);
    _avg = Reading.fromJson(json['avg']);
  }

  List<Reading> get readings => _readings;
  Reading get max => _max;
  Reading get min => _min;
  Reading get avg => _avg;
}
