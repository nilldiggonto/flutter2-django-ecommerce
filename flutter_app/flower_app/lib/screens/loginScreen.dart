import 'package:flower_app/screens/homeScreen.dart';
import 'package:flower_app/screens/registerScreen.dart';
import 'package:flower_app/state/userState.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _username = '';
  String _password = '';
  final _form = GlobalKey<FormState>();
  void _loginNow() async {
    var isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    bool isToken = await Provider.of<UserState>(context, listen: false)
        .loginNow(_username, _password);

    if (isToken) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Make sure username and pass right'),
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
    // print(_username);
    // print(_password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Here'),
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
                        onSaved: (v) {
                          _password = v!;
                        },
                        obscureText: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _loginNow();
                            },
                            child: Text('Login'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                  RegisterScreen.routeName);
                            },
                            child: Text('Register here'),
                          ),
                        ],
                      )
                    ],
                  )),
            )));
  }
}
