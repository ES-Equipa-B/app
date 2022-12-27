import 'package:app_sys_eng/models/measurement_unit.dart';
import 'package:app_sys_eng/models/settings.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsBloc {
  final _subject = BehaviorSubject<Settings>();

  Stream<Settings> get settings => _subject.stream;

  void loadFromPreferences() async {
    final pref = await SharedPreferences.getInstance();

    var mainStation = pref.getBool('main-station') ?? false;
    var measurementUnit = MeasurementUnit.values[pref.getInt('unit') ?? 0];
    _subject.add(Settings(mainStation, measurementUnit));
  }

  void setMainStation(bool value) async {
    final pref = await SharedPreferences.getInstance();
    final current = await settings.first;
    pref.setBool('main-station', value);
    _subject.add(Settings(value, current.measurementUnit));
  }

  void setMeasurementUnit(MeasurementUnit value) async {
    final pref = await SharedPreferences.getInstance();
    final current = await settings.first;
    pref.setInt('unit', value.index);
    _subject.add(Settings(current.mainStation, value));
  }
}

SettingsBloc settingsBloc = SettingsBloc();
