import 'package:flower_app/screens/productDetailScreen.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final int? id;
  final String? title;
  final String? image;
  final bool? favourite;

  const SingleProduct({
    Key? key,
    this.id,
    this.title,
    this.image,
    this.favourite,
  }) : super(key: key);

  // const SingleProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      // header: GridTileBar(),
      child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routeName, arguments: id);
          },
          child: Image.network("http://192.168.137.56:8000$image",
              fit: BoxFit.cover)),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(title!),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            favourite! ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
