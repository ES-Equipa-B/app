import 'package:app_sys_eng/models/station_card_data.dart';
import 'package:flutter/material.dart';

class GraphCard extends StatefulWidget {
  final StationCardData data;
  const GraphCard({super.key, required this.data});

  @override
  State<GraphCard> createState() => _GraphCard();
}

class _GraphCard extends State<GraphCard> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> combo = const [
      DropdownMenuItem(value: "Last hour", child: Text("Last hour")),
      DropdownMenuItem(value: "Last 6 hours", child: Text("Last 6 hours")),
      DropdownMenuItem(value: "Last 24 hours", child: Text("Last 24 hours")),
      DropdownMenuItem(value: "Last 7 days", child: Text("Last 7 days")),
      DropdownMenuItem(value: "Last month", child: Text("Last month")),
      DropdownMenuItem(value: "Last year", child: Text("Last year"))
    ];
    return combo;
  }

  String selectedValue = "Last hour";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 390,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 255, 242, 240)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Weather History",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: selectedValue,
                  items: dropdownItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
