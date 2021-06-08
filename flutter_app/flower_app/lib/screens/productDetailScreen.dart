import 'package:flower_app/state/productState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // const ProductDetailScreen({ Key? key }) : super(key: key);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final product = Provider.of<ProductState>(context).singleProduct(id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(children: [
          Image.network(
            "http://192.168.31.27:8000${product.image}",
            fit: BoxFit.cover,
            height: 450,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Market Price:\$ ${product.marketPrice.toString()}'),
                  // Text(,
                  // Text('Sell Price:'),
                  Text('Sell Price:\$ ${product.sellingPrice.toString()}'),
                ],
              ),
              ElevatedButton.icon(
                // color:Colors.amber,
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                label: Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Text('Description: ${product.description}'),
        ]),
      ),
    );
  }
}
