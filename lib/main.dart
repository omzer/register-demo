import 'package:flutter/material.dart';
import 'package:register_demo/pages/gender_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GenderPage(),
    );
  }
}
