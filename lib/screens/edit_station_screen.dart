import 'package:app_sys_eng/api/station_api_provider.dart';
import 'package:app_sys_eng/blocs/station_list_bloc.dart';
import 'package:app_sys_eng/colors.dart';
import 'package:app_sys_eng/widgets/station_form.dart';
import 'package:flutter/material.dart';

class EditStationScreen extends StatefulWidget {
  final int id;
  final String name, phone;
  const EditStationScreen(
      {Key? key, required this.id, required this.name, required this.phone})
      : super(key: key);

  @override
  State<EditStationScreen> createState() {
    return _EditStationScreen();
  }
}

class _EditStationScreen extends State<EditStationScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.name;
    _phoneController.text = widget.phone;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "New Station",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
          child: StationForm(
            formKey: _formKey,
            nameController: _nameController,
            phoneController: _phoneController,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            StationApiProvider()
                .updateStation(
                    widget.id, _nameController.text, _phoneController.text)
                .whenComplete(() {
              stationListBloc.fetchAllStations();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Station edited with success"),
                ),
              );
              Navigator.of(context).pop();
            }).onError(
              (error, stackTrace) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Error: $error"),
                ));
                return false;
              },
            );
          }
        },
        icon: const Icon(Icons.save),
        label: const Text("Save"),
      ),
    );
  }
}
