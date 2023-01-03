import 'package:app_sys_eng/blocs/settings_bloc.dart';
import 'package:app_sys_eng/blocs/station_list_bloc.dart';
import 'package:app_sys_eng/colors.dart';
import 'package:app_sys_eng/screens/new_station_screen.dart';
import 'package:app_sys_eng/widgets/station_card_grid.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 90,
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
            FocusScope.of(context).unfocus();
            TextEditingController().clear();
          },
          child: StreamBuilder(
            stream: settingsBloc.settings,
            builder: (context, settings) => StreamBuilder(
              stream: stationListBloc.allStations,
              builder: (context, snapshot) {
                if (snapshot.hasData && settings.hasData) {
                  return RefreshIndicator(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 16, right: 16),
                      child: StationCardGrid(
                        query: searchQuery,
                        stationList: snapshot.data!,
                        unit: settings.data!.measurementUnit,
                      ),
                    ),
                    onRefresh: () => stationListBloc.fetchAllStations(),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateNewStation(context);
        },
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.primaryFG,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> navigateNewStation(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NewStationScreen(),
      ),
    );
  }
}
