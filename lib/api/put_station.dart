import 'package:app_sys_eng/api/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void changePut(String name, String phone, int id) async {
  final response = await http.put(
      Uri.parse(apiURL + apiGetStation + id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{'name': name, 'phone': phone}));

  if (response.statusCode != 200) {
    throw Exception("Put Error");
  }
}
