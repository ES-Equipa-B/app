import 'package:app_sys_eng/api/station_api_provider.dart';
import 'package:app_sys_eng/models/station_list.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:developer' as developer;

class StationListBloc {
  final _stationApiProvider = StationApiProvider();
  final _stationsFetcher = BehaviorSubject<StationList>();

  Stream<StationList> get allStations => _stationsFetcher.stream;

  fetchAllStations() async {
    StationList stationList = await _stationApiProvider.fetchAllStations();
    _stationsFetcher.sink.add(stationList);
  }

  dispose() {
    _stationsFetcher.close();
  }
}

final stationListBloc = StationListBloc();
