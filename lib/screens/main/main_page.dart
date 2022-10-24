import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weatherapp/station_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const List<StationCardData> dummyData = [
    StationCardData(
        name: "Porto", temperature: 37.1, wind: 21, humidity: 58.7),
    StationCardData(
        name: "Braga", temperature: 32.0, wind: 15, humidity: 79.0),
    StationCardData(
        name: "Lisboa", temperature: 30.9, wind: 8, humidity: 31.5),
    StationCardData(
        name: "Fafe", temperature: 31.2, wind: 6, humidity: 42.3)
  ];

  List<StationCardData> stations = dummyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Container(
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), isDense: true,
                       prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) => setState(() {
                        stations = dummyData.where((element) => element.name.toLowerCase().startsWith(value.toLowerCase())).toList();
                      }),
                      )),
          actions: [
            IconButton(
                color: Theme.of(context).iconTheme.color,
                onPressed: () => {},
                icon: const Icon(Icons.settings_outlined))
          ],
        ),
      body: RefreshIndicator(
        child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.6,
            padding: const EdgeInsets.all(16),
            children: stations.map((e) => StationCard(data: e)).toList()),

          onRefresh: () => Future.sync(() => setState(() => {
                  stations.add(StationCardData(
                      name: "Setubal", temperature: 20, wind: 3, humidity: 14))
                })),
      ),

        floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
       },
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(188,255, 218, 212),
        foregroundColor: Color.fromARGB(255, 54, 6, 6),
        
      ),

    );
  }
}