import 'package:app_sys_eng/api/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
