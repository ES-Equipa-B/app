import 'package:app_sys_eng/models/station.dart';

class StationList {
  List<Station> _stations = [];

  StationList.fromJson(Iterable<dynamic> list) {
    _stations = list.map((e) => Station.fromJson(e)).toList();
  }

  List<Station> get stations => _stations;

  List<Station> filter(String? query) {
    if (query == null || query.isEmpty) {
      return _stations;
    } else {
      return _stations
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
