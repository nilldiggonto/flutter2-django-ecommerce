import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;

class ProductState with ChangeNotifier {
  List<Product> _products = [];

  Future<bool> getProducts() async {
    var url = Uri.parse('http://192.168.137.56:8000/api/v1/products/');
    try {
      http.Response response = await http.get(url, headers: {
        'Authorization': 'token 43c274621fcd8e19f9d5a016aeb5de422d156737'
      });
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

  Product singleProduct(id) {
    return _products.firstWhere((element) => element.id == id);
  }
}
