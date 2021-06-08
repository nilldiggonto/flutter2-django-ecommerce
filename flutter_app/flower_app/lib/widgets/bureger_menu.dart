import 'package:flower_app/screens/favouriteScreen.dart';
import 'package:flower_app/screens/homeScreen.dart';
import 'package:flutter/material.dart';

class BurgerMenu extends StatelessWidget {
  const BurgerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Flower Shop'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
            },
            trailing: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            title: Text('Home'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FavoriteScreen.routeName);
            },
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            title: Text('Favorite'),
          )
        ],
      ),
    );
  }
}
