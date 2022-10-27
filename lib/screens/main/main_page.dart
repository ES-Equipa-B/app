import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_sys_eng/widgets/station_card.dart';

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
        title: Container(
            child: TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) => setState(() {
            searchQuery = value;
          }),
        )),
        actions: [
          IconButton(
              color: Theme.of(context).iconTheme.color,
              onPressed: () => {
                Navigator.pushReplacementNamed(context, "/settings")
              },
              icon: const Icon(Icons.settings_outlined))
        ],
      ),
      body: FutureBuilder<List<StationCardData>>(
        future: stations,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
      return RefreshIndicator(
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
        onRefresh: () => Future.sync(() => setState(() => {
              snapshot.data!.add(StationCardData(
                  name: "Setubal", temperature: 20, wind: 3, humidity: 14))
            })));
          } else if(snapshot.hasError) {
            return Text ("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/newstation");
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(188, 255, 218, 212),
        foregroundColor: Color.fromARGB(255, 54, 6, 6),
      ),
    );
  }
}
