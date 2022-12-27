import 'package:app_sys_eng/api/readings_api_provider.dart';
import 'package:app_sys_eng/api/station_api_provider.dart';
import 'package:app_sys_eng/models/reading_list.dart';
import 'package:app_sys_eng/models/station.dart';
import 'package:app_sys_eng/models/time_frame.dart';
import 'package:rxdart/rxdart.dart';

class StationBloc {
  final _stationApiProvider = StationApiProvider();
  final _readingsApiProvider = ReadingsApiProvider();

  final _stationSubject = BehaviorSubject<Station>();
  final _readingsSubject = BehaviorSubject<ReadingList>();
  final _timeFrameSubject = BehaviorSubject<TimeFrame>();

  Stream<Station> get station => _stationSubject.stream;
  Stream<ReadingList> get readings => _readingsSubject.stream;
  Stream<TimeFrame> get timeFrame => _timeFrameSubject.stream;

  StationBloc() {
    _timeFrameSubject.sink.add(TimeFrame.hour);
  }

  fetchStation(int id) async {
    Station station = await _stationApiProvider.getStation(id);
    _stationSubject.sink.add(station);

    TimeFrame tf = await timeFrame.first;

    ReadingList readingsList = await _readingsApiProvider.getReadings(id, tf);
    _readingsSubject.sink.add(readingsList);
  }

  changeTimeFrame(TimeFrame timeFrame) async {
    _timeFrameSubject.sink.add(timeFrame);

    Station sta = await station.first;
    ReadingList readingsList =
        await _readingsApiProvider.getReadings(sta.id, timeFrame);
    _readingsSubject.sink.add(readingsList);
  }

  dispose() {
    _stationSubject.close();
    _readingsSubject.close();
    _timeFrameSubject.close();
  }
}
