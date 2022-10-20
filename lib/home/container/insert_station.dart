import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorMessage {
  String? name = '';
  String? phone = '';
}

class ContainerNewStation extends StatefulWidget {
  const ContainerNewStation({Key? key}) : super(key: key);

  @override
  _ContainerNewStation createState() {
    return _ContainerNewStation();
  }
}

class _ContainerNewStation extends State<ContainerNewStation> {
  final _text = TextEditingController();
  final _text2 = TextEditingController();
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
      return ErrorMessage().name = 'too short';
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
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        height: 650,
        width: 390,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: TextField(
                  controller: _text,
                  keyboardType: TextInputType.name,
                  decoration:
                      InputDecoration(labelText: 'Name', errorText: _errorText),
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
                padding: const EdgeInsets.only(top: 4),
                child: TextField(
                  controller: _text2,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(9),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                      labelText: 'Phone Number', errorText: _errorText2),
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
              Padding(
                padding: const EdgeInsets.only(left: 210),
                child: FloatingActionButton.extended(
                  backgroundColor: const Color.fromARGB(255, 255, 192, 192),
                  foregroundColor: Colors.black,
                  onPressed: () {
                    // Respond to button press
                    if (nameBool == false && phoneBool == false) {
                      _showDialog(context);
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("Create"),
                ),
              )
            ]),
      ),
    );
  }
}

_showDialog(BuildContext context) {
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
                Navigator.of(context).pop();
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
