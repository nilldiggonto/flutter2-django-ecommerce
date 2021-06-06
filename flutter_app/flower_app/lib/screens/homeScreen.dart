import 'package:flower_app/state/productState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({ Key? key }) : super(key: key);
  static const routename = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _init = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() async {
    if (_init) {
      // print('something');
      _isLoading = await Provider.of<ProductState>(context).getProducts();
      // print(_isLoading);
      setState(() {});
    }
    _init = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductState>(context).products;
    if (!_isLoading)
      return Scaffold(
          appBar: AppBar(
            title: Text('Flower Shop'),
          ),
          body: Center(
            child: Text('Something is wrong right'),
          ));
    else
      return Scaffold(
        appBar: AppBar(
          title: Text('Flower Shop'),
        ),
        body: ListView.builder(
          itemCount: product.length,
          itemBuilder: (context, index) => Container(
            child: Text(product[index].title!),
          ),
        ),
      );
  }
}
