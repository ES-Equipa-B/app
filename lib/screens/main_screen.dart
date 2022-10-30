import 'package:flutter/material.dart';
import 'package:app_sys_eng/widgets/station_card.dart';

import '../api/fetch_stations.dart';
import '../models/station_card_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<StationCardData>> stations;
  String searchQuery = "";

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
        child: GestureDetector(
          onTap: () {
            //here
            FocusScope.of(context).unfocus();
            TextEditingController().clear();
          },
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
                  onRefresh: () => Future.sync(
                      () => setState(() => {stations = fetchStations()})),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 255, 192, 192),
              ));
            },
          ),
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
}
