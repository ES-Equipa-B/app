import 'dart:convert';

import 'package:app_sys_eng/models/station.dart';
import 'package:http/http.dart' as http;

import 'package:app_sys_eng/api/constants.dart';
import 'package:app_sys_eng/models/station_list.dart';

class StationApiProvider {
  Future<StationList> fetchAllStations() async {
    final response = await http.get(Uri.parse(apiURL + apiFetchStations));

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return StationList.fromJson(list);
    } else {
      throw Exception('Failed to fetch stations');
    }
  }

  Future<Station> getStation(int id) async {
    final response =
        await http.get(Uri.parse(apiURL + apiGetStation + id.toString()));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return Station.fromJson(data);
    } else {
      throw Exception('Failed to load station');
    }
  }

  Future<bool> createStation(String name, String phone) async {
    final response = await http.post(
      Uri.parse(apiURL + apiPostStation),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{'name': name, 'phone': phone}),
    );

    switch (response.statusCode) {
      case 201:
        return true;
      case 500:
        throw Exception(jsonDecode(response.body)['message']);
      default:
        throw Exception("Unexpected error when updating station");
    }
  }

  Future<bool> updateStation(int id, String name, String phone) async {
    final response = await http.put(
      Uri.parse(apiURL + apiGetStation + id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{'name': name, 'phone': phone}),
    );

    switch (response.statusCode) {
      case 200:
        return true;
      case 500:
        throw Exception(jsonDecode(response.body)['message']);
      default:
        throw Exception("Unexpected error when updating station");
    }
  }

  Future<bool> deleteStation(int id) async {
    final response = await http.delete(
      Uri.parse(apiURL + apiDeleteStation + id.toString()),
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
        throw Exception("Unexpected error when deleting station");
    }
  }
}
