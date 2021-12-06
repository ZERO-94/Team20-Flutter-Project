import 'package:food_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class TextFieldWidget extends StatefulWidget {
  TextFieldWidget(
      {Key? key,
      required this.iconEmail,
      required this.hintTextEmail,
      required this.iconPassword,
      required this.hintTextPassword})
      : super(key: key);
  final Icon iconEmail;
  final Icon iconPassword;
  final String hintTextEmail;
  final String hintTextPassword;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  FocusNode focusNodeEmail = FocusNode();

  FocusNode focusNodePassword = FocusNode();

  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();


  final auth = Auth();

  String get email => controllerEmail.text;

  String get password => controllerPassword.text;

  bool isRegisterMode = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: controllerEmail,
            focusNode: focusNodeEmail,
            decoration: InputDecoration(
                hintText: widget.hintTextEmail, prefixIcon: widget.iconEmail),
          ),
          const SizedBox(
            height: 25.0,
          ),
          TextField(
            controller: controllerPassword,
            focusNode: focusNodePassword,
            obscureText: true,
            decoration: InputDecoration(
                hintText: widget.hintTextPassword,
                prefixIcon: widget.iconPassword),
          ),
          const SizedBox(
            height: 35.0,
          ),
          Container(
            width: width / 1.3,
            height: 49.0,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                const Color(0xFFF6284D),
              )),
              onPressed: () async{

                if (isRegisterMode == false) {
                   await auth.signInWithEmailAndPasswords(email, password);
                } else {
                   await auth.createUserWithEmailAndPasswords(email, password);
                }
                controllerEmail.clear();
                controllerPassword.clear();
              },
              child: Text(
                isRegisterMode ? 'Sign Up' : 'Login',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 19.0),
              ),
            ),
          ),
          const SizedBox(
            height: 35.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isRegisterMode ? '' : 'New to Star food?'),
              const SizedBox(
                width: 13.0,
              ),
              isRegisterMode
                  ? TextButton(
                      onPressed: () async {
                        setState(() {
                          if (isRegisterMode == false) {
                            isRegisterMode = true;
                          } else {
                            isRegisterMode = false;
                          }
                        });
                      },
                      child: const Text('Sign In'),
                    )
                  : TextButton(
                      onPressed: () async {
                        setState(() {
                          if (isRegisterMode == false) {
                            isRegisterMode = true;
                          } else {
                            isRegisterMode = false;
                          }
                        });
                      },
                      child: const Text('Register'),
                    )
            ],
          )
        ],
      ),
    );
  }
}
