import 'package:app_sys_eng/api/constants.dart';

import '../models/station_card_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<StationCardData> getStation(int id) async {
  final response =
      await http.get(Uri.parse(apiURL + apiGetStation + id.toString()));

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    return StationCardData.fromJson(data);
  } else {
    throw Exception('Failed to load station');
  }
}
