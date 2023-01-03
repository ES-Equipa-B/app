import 'package:app_sys_eng/api/station_api_provider.dart';
import 'package:app_sys_eng/blocs/station_list_bloc.dart';
import 'package:app_sys_eng/colors.dart';
import 'package:app_sys_eng/widgets/station_form.dart';
import 'package:flutter/material.dart';

class NewStationScreen extends StatefulWidget {
  const NewStationScreen({Key? key}) : super(key: key);

  @override
  State<NewStationScreen> createState() {
    return _NewStationScreen();
  }
}

class _NewStationScreen extends State<NewStationScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

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
                .createStation(_nameController.text, _phoneController.text)
                .whenComplete(() {
              stationListBloc.fetchAllStations();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Station added with success"),
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
        icon: const Icon(Icons.check),
        label: const Text("Create"),
      ),
    );
  }
}
