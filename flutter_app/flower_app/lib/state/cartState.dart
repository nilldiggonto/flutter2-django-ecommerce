import 'dart:convert';

import 'package:flower_app/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;

class CartState with ChangeNotifier {
  final storage = new LocalStorage('usertoken');
  cartModel? _cartModel;

  Future<void> getCartData() async {
    String url = 'http://192.168.31.27:8000/api/v1/cart/';
    var token = storage.getItem('token');
    try {
      http.Response response = await http
          .get(Uri.parse(url), headers: {"Authorization": "Token $token"});
      var data = json.decode(response.body) as Map;
      List<cartModel> demo = [];
      if (data['error'] == false) {
        data['data'].forEach((element) {
          cartModel cartMode = cartModel.fromJson(element);
          demo.add(cartMode);
        });
        _cartModel = demo[0];
        notifyListeners();
      } else {
        print(data['data']);
      }
    } catch (e) {
      print('error');
    }
  }
}
