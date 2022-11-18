import 'package:app_sys_eng/api/get_station.dart';
import 'package:app_sys_eng/api/put_station.dart';
import 'package:app_sys_eng/models/station_card_data.dart';
import 'package:app_sys_eng/screens/data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorMessage {
  String? name = '';
  String? phone = '';
  int aux = 0;
}

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
  final _text = TextEditingController();
  final _text2 = TextEditingController();

  late Future<StationCardData> station;
  @override
  void initState() {
    super.initState();
    station = getStation(widget.id);
    _text.text = widget.name;
    _text2.text = widget.phone;
  }

  bool nameBool = true;
  bool phoneBool = true;
  //CORRIGIR
  String? get _errorText {
    final text = _text.value.text;
    final text2 = _text2.value.text;

    if (text.isEmpty && text2.isEmpty) {
      nameBool = true;
      phoneBool = true;
      return null;
    } else if (text.isEmpty) {
      nameBool = true;
      return ErrorMessage().name = 'Name can\'t be empty';
    }
    nameBool = false;

    return null;
  }

  String? get _errorText2 {
    final text = _text.value.text;
    final text2 = _text2.value.text;

    if (text.isEmpty && text2.isEmpty) {
      nameBool = true;
      phoneBool = true;
      return null;
    } else if (text2.isEmpty) {
      phoneBool = true;
      return ErrorMessage().name = 'Phone can\'t be empty';
    } else if (text2.length < 9) {
      phoneBool = true;
      return ErrorMessage().name = 'Too short';
    }
    phoneBool = false;

    return null;
  }

  @override
  void dispose() {
    _text.dispose();
    _text2.dispose();
    super.dispose();
  }

  final _texto = '';
  final _texto2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Edit Station",
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
      body: GestureDetector(
          onTap: () {
            //here
            FocusScope.of(context).unfocus();
            TextEditingController().clear();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: TextField(
                      controller: _text,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          errorText: _errorText,
                          border: const OutlineInputBorder()),
                      onChanged: (text) => setState(() => _texto),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "The stations's identifier name (ex: Porto)",
                      style: TextStyle(color: Color(0xff534341), fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: _text2,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(9),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                          labelText: 'Phone Number',
                          errorText: _errorText2,
                          border: const OutlineInputBorder()),
                      onChanged: (text) => setState(() => _texto2),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "The stations's phone number (ex: 123456789)",
                      style: TextStyle(color: Color(0xff534341), fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                    height: 370,
                  ),
                ],
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 255, 192, 192),
        foregroundColor: Colors.black,
        onPressed: () {
          // Respond to button press
          if (nameBool == false && phoneBool == false) {
            _showDialog(
                context, _text.value.text, _text2.value.text, widget.id);
          } else {
            _erroDialog(context);
          }
        },
        icon: const Icon(Icons.save),
        label: const Text("Save"),
      ),
    );
  }
}

_showDialog(BuildContext context, String name, String phone, int id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Expanded(
        child: AlertDialog(
          title: const Text('Are you sure?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                changePut(name, phone, id);
                Navigator.of(context).pop();
                Navigator.of(context).pop(true);
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(builder: (context) => DataScreen(id: id)),
                //     (route) => false);
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      );
    },
  );
}

_erroDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Column(children: [
        Expanded(
          child: AlertDialog(
            title: const Text(
              'Please, complete de fields first',
              style: TextStyle(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        )
      ]);
    },
  );
}
