import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({ Key? key }) : super(key: key);
  static const routename = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flower Shop'),
      ),
    );
  }
}
