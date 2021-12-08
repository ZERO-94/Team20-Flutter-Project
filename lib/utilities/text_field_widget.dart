import 'package:food_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  String get _email => controllerEmail.text;

  String get _password => controllerPassword.text;

  bool _isValid(String email) {
    return email.isNotEmpty;
  }

  bool get submitted =>
      _isValid(controllerEmail.text) && _isValid(controllerPassword.text);

  void _emailEditingComplete(BuildContext context) {
    var newScope =
        _isValid(controllerEmail.text) ? focusNodePassword : focusNodeEmail;
    FocusScope.of(context).requestFocus(newScope);
  }

  bool showTextEmailError = false;
  bool showTextPasswordError = false;
  bool isRegisterMode = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);

    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          TextField(
            onEditingComplete: () {
              _emailEditingComplete(context);
            },
            keyboardType: TextInputType.emailAddress,
            controller: controllerEmail,
            focusNode: focusNodeEmail,
            decoration: InputDecoration(
                hintText: widget.hintTextEmail,
                prefixIcon: widget.iconEmail,
                errorText:
                    showTextEmailError ? 'Email ID can\'t be empty' : null),
            onChanged: (email) {
              setState(() {
                if (_isValid(email)) {
                  showTextEmailError = false;
                } else {
                  showTextEmailError = true;
                }
              });
            },
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
                errorText:
                    showTextPasswordError ? 'Password can\'t be empty' : null,
                prefixIcon: widget.iconPassword),
            onChanged: (password) {
              setState(() {
                if (_isValid(password)) {
                  showTextPasswordError = false;
                } else {
                  showTextPasswordError = true;
                }
              });
            },
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
                submitted ? const Color(0xFFF6284D) : Colors.grey,
              )),
              onPressed: submitted
                  ? () async {
                      if (isRegisterMode == false) {
                        await auth.signInWithEmailAndPasswords(
                            _email, _password);
                      } else {
                        await auth.createUserWithEmailAndPasswords(
                            _email, _password);
                      }

                      controllerEmail.clear();
                      controllerPassword.clear();
                      Navigator.pushNamed(context, 'main_page');
                    }
                  : null,
              child:   Text(
                isRegisterMode ? 'Sign Up' : 'Login',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 19.0),
              )
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
                          showTextEmailError = false;
                          showTextPasswordError = false;
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
                        controllerEmail.clear();
                        controllerPassword.clear();
                        setState(() {
                          showTextEmailError = false;
                          showTextPasswordError = false;
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
