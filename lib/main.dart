// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import './pages/home_page.dart';
import 'pages/train_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      
    );
  }
}