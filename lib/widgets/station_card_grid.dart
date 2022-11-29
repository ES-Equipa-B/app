import 'package:app_sys_eng/blocs/station_list_bloc.dart';
import 'package:app_sys_eng/widgets/station_card.dart';
import 'package:flutter/material.dart';

import '../models/station_list.dart';

class StationCardGrid extends StatelessWidget {
  final String? query;
  final StationList stationList;

  const StationCardGrid({super.key, this.query, required this.stationList});

  @override
  Widget build(BuildContext context) {
    final stations = stationList.filter(query);

    return GridView.builder(
      itemCount: stations.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final station = stations[index];
        return StationCard(
          data: station,
          requestRefresh: () => stationListBloc.fetchAllStations(),
        );
      },
    );
  }
}
