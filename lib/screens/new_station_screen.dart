import 'package:app_sys_eng/api/post_station.dart';
import 'package:app_sys_eng/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorMessage {
  String? name = '';
  String? phone = '';
}

class NewStationScreen extends StatefulWidget {
  const NewStationScreen({Key? key}) : super(key: key);

  @override
  State<NewStationScreen> createState() {
    return _NewStationScreen();
  }
}

class _NewStationScreen extends State<NewStationScreen> {
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
          "New Station",
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
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
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 255, 192, 192),
        foregroundColor: Colors.black,
        onPressed: () {
          // Respond to button press
          if (nameBool == false && phoneBool == false) {
            _showDialog(context, _text.value.text, _text2.value.text);
          } else {
            _erroDialog(context);
          }
        },
        icon: const Icon(Icons.check),
        label: const Text("Create"),
      ),
    );
  }
}

_showDialog(BuildContext context, String name, String phone) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Column(children: [
        Expanded(
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
                  createPost(name, phone);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Yes',
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
