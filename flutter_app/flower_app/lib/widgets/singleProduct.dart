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
      child: Image.asset(""),
      footer: GridTileBar(),
    );
  }
}
