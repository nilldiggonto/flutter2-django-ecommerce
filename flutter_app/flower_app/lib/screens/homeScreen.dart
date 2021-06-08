import 'package:flower_app/state/productState.dart';
import 'package:flower_app/widgets/bureger_menu.dart';
import 'package:flower_app/widgets/singleProduct.dart';
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
          drawer: BurgerMenu(),
          appBar: AppBar(
            title: Text('Flower Shop'),
          ),
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 2,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: product.length,
            itemBuilder: (context, index) => SingleProduct(
              id: product[index].id,
              title: product[index].title,
              image: product[index].image,
              favourite: product[index].favourite,
            ),
          ));
  }
}
