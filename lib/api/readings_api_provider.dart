import 'dart:convert';

import 'package:app_sys_eng/api/constants.dart';
import 'package:app_sys_eng/models/reading.dart';
import 'package:app_sys_eng/models/reading_list.dart';
import 'package:http/http.dart' as http;

import '../models/time_frame.dart';

class ReadingsApiProvider {
  Future<ReadingList> getReadings(int id, TimeFrame timeFrame) async {
    final response = await http.get(Uri.http(
        apiURL, '/stations/$id/readings', {'timeframe': timeFrame.apiString}));
    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> data = jsonDecode(response.body);
        return ReadingList.fromJson(data);
      case 404:
        throw Exception(jsonDecode(response.body)['message']);
      default:
        throw Exception("Unexpected error when get readings");
    }
  }

  Future<bool> wipeData(int stationId) async {
    final response = await http.delete(
      Uri.http(apiURL, '/stations/$stationId/readings'),
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
        Uri.http(apiURL, '/stations/$stationId/readings'),
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
