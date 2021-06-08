import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
// import 'package:localstorage/localstorage.dart';
// import 'package:localstorage/localstorage.dart'

class UserState with ChangeNotifier {
  // LocalStorage
  // LocalSto
  final storage = new LocalStorage('userToken');
  Future<bool> loginNow(String uname, String password) async {
    String url = 'http://192.168.31.27:8000/api/v1/login/';
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"username": uname, "password": password}));
      // print(response.body);
      var data = json.decode(response.body) as Map;
      if (data.containsKey("token")) {
        // print(data);
        storage.setItem("token", data['token']);
        print(storage.getItem('token'));
        return true;
      }
      return false;
      // return true;
    } catch (e) {
      print(e);
      print('login error');
      return false;
    }
  }

  //register
  Future<bool> RegisterNow(String uname, String password) async {
    String url = 'http://192.168.31.27:8000/api/v1/register/';
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: json.encode({"username": uname, "password": password}));
      // print(response.body);
      var data = json.decode(response.body) as Map;
      if (data['error'] == false) {
        return true;
      }
      return false;
      // return true;
    } catch (e) {
      print(e);
      print('register error');
      return false;
    }
  }
}
