import 'package:flower_app/screens/favouriteScreen.dart';
import 'package:flower_app/screens/homeScreen.dart';
import 'package:flower_app/screens/loginScreen.dart';
import 'package:flower_app/screens/productDetailScreen.dart';
import 'package:flower_app/screens/registerScreen.dart';
import 'package:flower_app/state/productState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ProductState())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
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
