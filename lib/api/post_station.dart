import 'package:app_sys_eng/api/constants.dart';

import '../models/station_card_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void createPost(String name, String phone) async {
  final response = await http.post(Uri.parse(apiURL + apiPostStation),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{'name': name, 'phone': phone}));

  if (response.statusCode != 201) {
    throw Exception("Post Error");
  }
}
