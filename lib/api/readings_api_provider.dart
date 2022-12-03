import 'dart:convert';

import 'package:app_sys_eng/api/constants.dart';
import 'package:app_sys_eng/models/reading.dart';
import 'package:http/http.dart' as http;

class ReadingsApiProvider {
  Future<bool> wipeData(int stationId) async {
    final response = await http.delete(
      Uri.parse(apiURL + apiDeleteStation + stationId.toString() + readings),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    switch (response.statusCode) {
      case 200:
        return true;
      case 404:
        throw Exception(jsonDecode(response.body)['message']);
      default:
        throw Exception("Unexpected error when deleting data");
    }
  }

  Future<bool> insertReadings(int stationId, List<Reading> readings) async {
    final response = await http.post(
        Uri.parse("$apiURL/stations/$stationId/readings"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(readings));

    switch (response.statusCode) {
      case 201:
        return true;
      case 404:
        throw Exception(jsonDecode(response.body)['message']);
      default:
        throw Exception("Unexpected error when deleting data");
    }
  }
}
