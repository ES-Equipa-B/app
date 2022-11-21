import 'package:app_sys_eng/api/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
