import 'package:flower_app/widgets/bureger_menu.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  // const FavoriteScreen({ Key? key }) : super(key: key);
  static const routeName = '/fav-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marked Items'),
      ),
      drawer: BurgerMenu(),
    );
  }
}
