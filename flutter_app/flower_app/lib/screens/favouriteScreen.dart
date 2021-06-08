import 'package:flower_app/state/productState.dart';
import 'package:flower_app/widgets/bureger_menu.dart';
import 'package:flower_app/widgets/singleProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  // const FavoriteScreen({ Key? key }) : super(key: key);
  static const routeName = '/fav-screen';

  @override
  Widget build(BuildContext context) {
    final favorite = Provider.of<ProductState>(context).favorites;
    return Scaffold(
        appBar: AppBar(
          title: Text('Marked Items'),
        ),
        drawer: BurgerMenu(),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 2,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: favorite.length,
          itemBuilder: (context, index) => SingleProduct(
            id: favorite[index].id,
            title: favorite[index].title,
            image: favorite[index].image,
            favourite: favorite[index].favourite,
          ),
        ));
  }
}
