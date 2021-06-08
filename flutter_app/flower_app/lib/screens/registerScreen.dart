import 'package:flower_app/screens/loginScreen.dart';
import 'package:flower_app/state/userState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  // const RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _username = '';
  String _password = '';
  String _confPassword = '';

  final _form = GlobalKey<FormState>();
  _regiseterNow() async {
    var isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    // print(_username);
    // print(_password);
    bool isRegister = await Provider.of<UserState>(context, listen: false)
        .RegisterNow(_username, _password);

    if (isRegister) {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Username Already Exists'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register  Here'),
        ),
        body: Padding(
            padding: EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'Enter your username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Username",
                        ),
                        onSaved: (v) {
                          _username = v!;
                        },
                      ),
                      TextFormField(
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(hintText: "Password"),
                        onChanged: (v) {
                          setState(() {
                            _confPassword = v;
                          });
                        },
                        onSaved: (v) {
                          _password = v!;
                        },
                        obscureText: true,
                        autocorrect: false,
                        enableSuggestions: false,
                      ),
                      TextFormField(
                        validator: (v) {
                          if (_confPassword != v) {
                            return 'Confirm password';
                          }
                          if (v!.isEmpty) {
                            return 'Confirm Password';
                          }
                          return null;
                        },
                        decoration:
                            InputDecoration(hintText: "Confirm Password"),
                        onSaved: (v) {
                          _password = v!;
                        },
                        obscureText: true,
                        autocorrect: false,
                        enableSuggestions: false,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _regiseterNow();
                            },
                            child: Text('Registration'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginScreen.routeName);
                            },
                            child: Text('login here'),
                          ),
                        ],
                      )
                    ],
                  )),
            )));
  }
}
