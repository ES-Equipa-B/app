import 'package:app_sys_eng/api/station_api_provider.dart';
import 'package:app_sys_eng/models/station.dart';
import 'package:rxdart/rxdart.dart';

class StationBloc {
  final _stationApiProvider = StationApiProvider();
  final _stationFetcher = PublishSubject<Station>();

  Stream<Station> get station => _stationFetcher.stream;

  fetchStation(int id) async {
    Station stationList = await _stationApiProvider.getStation(id);
    _stationFetcher.sink.add(stationList);
  }

  dispose() {
    _stationFetcher.close();
  }
}
