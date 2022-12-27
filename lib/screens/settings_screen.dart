import 'package:app_sys_eng/blocs/settings_bloc.dart';
import 'package:app_sys_eng/colors.dart';
import 'package:app_sys_eng/models/measurement_unit.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder(
        stream: settingsBloc.settings,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var settings = snapshot.data!;
            return SettingsList(
              lightTheme:
                  const SettingsThemeData(settingsListBackground: Colors.white),
              sections: [
                SettingsSection(
                  tiles: [
                    SettingsTile.switchTile(
                      title: const Text('Main Station'),
                      description:
                          const Text('Make this device a main station'),
                      initialValue: settings.mainStation,
                      onToggle: (value) => settingsBloc.setMainStation(value),
                      activeSwitchColor: AppColors.primary,
                    ),
                    SettingsTile(
                      title: const Text("Measurement Unit"),
                      value: Text(settings.measurementUnit.name),
                      trailing: DropdownButton(
                        items: MeasurementUnit.values
                            .map((e) => DropdownMenuItem<MeasurementUnit>(
                                  value: e,
                                  child: Text(e.name),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            settingsBloc.setMeasurementUnit(value);
                          }
                        },
                        underline: const SizedBox(),
                      ),
                    )
                  ],
                )
              ],
            );
          } else {
            return const Text("Loading...");
          }
        },
      ),
    );
  }
}
