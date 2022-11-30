import 'package:app_sys_eng/api/constants.dart';
import 'package:app_sys_eng/models/graph_reading.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<GraphReadings> getReadings(int id, String timeframe) async {
  final response = await http.get(
    Uri.parse(apiURL + apiGetStation + id.toString() + read + timeframe),
  );
  print(response.body);
  switch (response.statusCode) {
    case 200:
      Map<String, dynamic> data = jsonDecode(response.body);
      return GraphReadings.fromJson(data);
    case 404:
      throw Exception(jsonDecode(response.body)['message']);
    default:
      throw Exception("Unexpected error when get readings");
  }
}
