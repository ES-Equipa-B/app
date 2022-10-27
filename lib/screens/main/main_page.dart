import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:app_sys_eng/widgets/station_card.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<StationCardData>> stations;
  String searchQuery = "";

  Future<List<StationCardData>> fetchStations() async {
    final response =
        await http.get(Uri.parse("http://campheimdall.ddns.net:5000/stations"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Iterable list = jsonDecode(response.body);
      return list.map((e) => StationCardData.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    stations = fetchStations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextField(
          decoration: const InputDecoration(
            hintText: "Search Station",
            hintStyle: TextStyle(fontSize: 15),
            border: OutlineInputBorder(),
            isDense: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) => setState(() {
            searchQuery = value;
          }),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                color: Theme.of(context).iconTheme.color,
                onPressed: () => {Navigator.pushNamed(context, "/settings")},
                icon: const Icon(Icons.settings)),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<StationCardData>>(
          future: stations,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.6,
                      padding: const EdgeInsets.all(16),
                      children: snapshot.data!
                          .where((element) => element.name
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase()))
                          .map((e) => StationCard(data: e))
                          .toList()),
                ),
                onRefresh: () => Future.sync(() => setState(() => {})),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/newstation");
        },
        backgroundColor: const Color.fromARGB(255, 255, 192, 192),
        foregroundColor: const Color.fromARGB(255, 54, 6, 6),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<List<StationCardData>> fetchStations() async {
    final response =
        await http.get(Uri.parse("http://campheimdall.ddns.net:5000/stations"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Iterable list = jsonDecode(response.body);
      return list.map((e) => StationCardData.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
