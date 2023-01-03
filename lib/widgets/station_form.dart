import 'package:flutter/material.dart';

class StationForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController, phoneController;

  const StationForm(
      {super.key,
      required this.formKey,
      required this.nameController,
      required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 16,
        children: [
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
              helperText: "The stations's identifier name (ex: Porto)",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
          ),
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
              helperText: "The stations's phone number (ex: +351912345678)",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'The phone number is required';
              } else if (!RegExp(r'\+\d+$').hasMatch(value)) {
                return 'Incorrect format (ex: +351912345678)';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
