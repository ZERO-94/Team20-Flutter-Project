import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/user.dart';
import 'package:provider/provider.dart';

import '../provider_service/user_provider.dart';

class UserInforForm extends StatefulWidget {
  const UserInforForm({Key? key}) : super(key: key);

  @override
  _UserInforFormState createState() => _UserInforFormState();
}

class _UserInforFormState extends State<UserInforForm> {
  final _formKey = GlobalKey<FormState>();
  String gender = "Nam";
  String workingLevel = '1';
  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _controllerHeight = TextEditingController();
  final TextEditingController _controllerWeight = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  bool enabled = true;
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    final userProvider = Provider.of<UserProvider>(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  enabled: enabled,
                  controller: _controllerName,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Tên',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  enabled: enabled,
                  controller: _controllerAge,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Tuổi',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Giới tính',
                  ),
                  value: gender,
                  onChanged: enabled
                      ? (String? newValue) {
                          setState(() {
                            gender = newValue!;
                          });
                        }
                      : null,
                  items: <String>['Nam', 'Nữ']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  enabled: enabled,
                  controller: _controllerHeight,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Chiều cao',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  enabled: enabled,
                  controller: _controllerWeight,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Cân nặng',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Mức độ làm việc',
                  ),
                  value: workingLevel,
                  onChanged: enabled
                      ? (String? newValue) {
                          setState(() {
                            workingLevel = newValue!;
                          });
                        }
                      : null,
                  items: <String>['1', '2', '3', '4', '5', '6', '7']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[800],
                    ),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (enabled) {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          _firestore.collection('users').add({
                            'age': _controllerAge.text,
                            'gender': gender,
                            'height': _controllerHeight.text,
                            'name': _controllerName.text,
                            'weight': _controllerWeight.text,
                            'working_level': workingLevel
                          });
                          userProvider.addUser(
                              _controllerName.text,
                              int.parse(_controllerAge.text),
                              double.parse(_controllerWeight.text),
                              double.parse(_controllerHeight.text),
                              int.parse(workingLevel),
                              gender);
                          setState(() {
                            enabled = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: enabled
                                    ? const Text('Lưu thông tin thành công')
                                    : const Text(
                                        'Thay đổi thông tin thành công')),
                          );
                        }
                      } else {
                        setState(() {
                          enabled = true;
                        });
                      }
                    },
                    child: enabled
                        ? const Text('Lưu thông tin')
                        : const Text('Thay đổi thông tin'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
