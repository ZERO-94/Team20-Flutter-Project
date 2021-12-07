import 'package:flutter/material.dart';
import 'package:food_app/models/user.dart';
import 'package:provider/provider.dart';

class UserInforForm extends StatefulWidget {
  const UserInforForm({Key? key}) : super(key: key);

  @override
  _UserInforFormState createState() => _UserInforFormState();
}

class _UserInforFormState extends State<UserInforForm> {
  final _formKey = GlobalKey<FormState>();
  String gender = "Nam";
  String workingLevel = '1';



  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Tuổi',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {

              },
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Giới tính',
              ),
              value: gender,
              onChanged: (String? newValue) {
                setState(() {
                  gender = newValue!;
                });
              },
              items: <String>['Nam', 'Nữ']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Chiều cao',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {

              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Cân nặng',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {

              },
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Mức độ làm việc',
              ),
              value: workingLevel,
              onChanged: (String? newValue) {
                setState(() {
                  workingLevel = newValue!;
                });
              },
              items: <String>['1', '2', '3', '4', '5' ,'6' ,'7']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red[800],),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Thay đổi thông tin thành công')),
                      );
                    }
                  },
                  child: const Text('Thay đổi thông tin'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
