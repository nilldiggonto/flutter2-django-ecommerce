import 'package:flutter/cupertino.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;

class ProductState with ChangeNotifier {
  List<Product> _products = [];

  Future<bool> getProducts() async {
    // var url = Uri.parse('https://example.com/whatsit/create');
    String url = 'http://192.168.137.56:8000/api/v1/products/';
    try {
      http.Response response = await http.get(Uri.parse(url));
      print(response.body);
      return true;
    } catch (e) {
      print(e);
      print('cathing error');
      print('e getproducts');
      return false;
    }
  }
}
