import 'package:flutter/material.dart';
import 'package:register_demo/static_data/gender_type.dart';

class MyAvatar extends StatefulWidget {
  final GenderType type;

  MyAvatar({
    this.type = GenderType.boy,
  });

  @override
  _MyAvatarState createState() => _MyAvatarState();
}

class _MyAvatarState extends State<MyAvatar> {
  double size = 200;
  int duration = 200;
  Color color = Colors.blue;
  Curve curve = Curves.fastLinearToSlowEaseIn;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: curve,
      duration: Duration(milliseconds: duration),
      width: size,
      height: size,
      child: CircleAvatar(
        radius: double.infinity,
        backgroundColor: color,
        child: InkWell(
          onTap: _onClick,
          child: Image.asset(
            'lib/imgs/${widget.type == GenderType.boy ? 'boy' : 'girl'}.png',
            scale: 2.5,
          ),
        ),
      ),
    );
  }

  void _onClick() async {
    // First animation
    size = 80;
    duration = 250;
    color = Colors.yellow;
    curve = Curves.fastLinearToSlowEaseIn;
    setState(() {});
    await Future.delayed(
      Duration(milliseconds: 270),
    );
    // Second animation
    curve = Curves.easeInCirc;
    duration = 180;
    size = 200;
    color = Colors.amber;
    setState(() {});
  }
}
