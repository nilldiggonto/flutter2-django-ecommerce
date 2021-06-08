// import 'dart:html';

import 'package:flower_app/screens/favouriteScreen.dart';
import 'package:flower_app/screens/homeScreen.dart';
import 'package:flower_app/screens/loginScreen.dart';
import 'package:flower_app/screens/productDetailScreen.dart';
import 'package:flower_app/screens/registerScreen.dart';
import 'package:flower_app/state/productState.dart';
import 'package:flower_app/state/userState.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = new LocalStorage('userToken');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductState()),
        ChangeNotifierProvider(create: (context) => UserState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: storage.ready,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (storage.getItem('token') == null) {
                return LoginScreen();
              }
              return HomeScreen();
            }),
        // home: HomeScreen(),
        routes: {
          HomeScreen.routename: (context) => HomeScreen(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          FavoriteScreen.routeName: (context) => FavoriteScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen()
        },
      ),
    );
  }
}
