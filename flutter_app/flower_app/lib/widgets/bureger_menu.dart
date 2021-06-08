import 'package:flower_app/screens/favouriteScreen.dart';
import 'package:flower_app/screens/homeScreen.dart';
import 'package:flower_app/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class BurgerMenu extends StatefulWidget {
  // const BurgerMenu({Key? key}) : super(key: key);
  @override
  _BurgerMenuState createState() => _BurgerMenuState();
}

class _BurgerMenuState extends State<BurgerMenu> {
  final storage = new LocalStorage('userToken');

  void _logoutNow() async {
    await storage.clear();
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }

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
          ),
          Spacer(),
          ListTile(
            onTap: () {
              _logoutNow();
            },
            trailing: Icon(
              Icons.logout,
              color: Colors.blue,
            ),
            title: Text('logout'),
          )
        ],
      ),
    );
  }
}
