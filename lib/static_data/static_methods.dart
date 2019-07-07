import 'package:flutter/material.dart';

class StaticMethods {
  static void goTo(context, to) {
    var route = MaterialPageRoute(builder: (_) => to);
    Navigator.push(context, route);
  }
}
