import 'package:app_sys_eng/api/constants.dart';

import '../models/station_card_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<StationCardData>> fetchStations() async {
  final response = await http.get(Uri.parse(apiURL + apiFetchStations));

  if (response.statusCode == 200) {
    Iterable list = jsonDecode(response.body);
    return list.map((e) => StationCardData.fromJson(e)).toList();
  } else {
    throw Exception('Failed to fetch stations');
  }
}
