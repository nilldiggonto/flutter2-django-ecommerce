import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;

class ProductState with ChangeNotifier {
  final storage = new LocalStorage('userToken');
  List<Product> _products = [];

  Future<bool> getProducts() async {
    var token = storage.getItem('token');
    var url = Uri.parse('http://192.168.31.27:8000/api/v1/products/');
    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': 'token $token'});
      var data = json.decode(response.body) as List;
      List<Product> temp = [];
      data.forEach((element) {
        Product product = Product.fromJson(element);
        temp.add(product);
      });
      print(response);
      // print(response.body);
      _products = temp;
      return true;
    } catch (e) {
      print(e);
      print('cathing error');
      print('e getproducts');
      return false;
    }
  }

  //get all products
  List<Product> get products {
    return [..._products];
  }

  List<Product> get favorites {
    return _products.where((element) => element.favourite == true).toList();
  }

  Product singleProduct(id) {
    return _products.firstWhere((element) => element.id == id);
  }

  Future<void> favoriteBtn(int id) async {
    var url = Uri.parse('http://192.168.31.27:8000/api/v1/favorite/');
    var token = storage.getItem('token');
    try {
      http.Response response = await http.post(url,
          body: json.encode({
            'id': id,
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'token $token'
          });
      print(response);
      // var data = jsonR.decode(response.body);
      getProducts();
      // print(data);

      // if(data['error']==false)

      // print(data);
      // notifyListeners();
      // print(response.body);
      // _products = temp;
      // return true;
    } catch (e) {
      print(e);
      print('cathing error');
      print('e getproducts');
      // return false;
    }
  }
}
