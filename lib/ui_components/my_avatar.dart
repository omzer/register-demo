import 'package:flutter/material.dart';
import 'package:register_demo/static_data/gender_type.dart';

class MyAvatar extends StatefulWidget {
  final GenderType type;
  final String tag;
  bool clicked;
  MyAvatar({
    this.type = GenderType.boy,
    this.tag = 'boy',
    this.clicked = false,
  });

  @override
  _MyAvatarState createState() => _MyAvatarState();
}

class _MyAvatarState extends State<MyAvatar> {
  double size = 200;
  int duration = 200;
  Color color = Colors.indigo;
  Curve curve = Curves.fastLinearToSlowEaseIn;
  @override
  Widget build(BuildContext context) {
    if (widget.clicked) color = Colors.green;
    return AnimatedContainer(
      curve: curve,
      duration: Duration(milliseconds: duration),
      width: size,
      height: size,
      child: CircleAvatar(
        radius: double.infinity,
        backgroundColor: color,
        child: InkWell(
          onTap: widget.clicked ? null : _onClick,
          child: Hero(
            tag: widget.tag,
            child: Image.asset(
              'lib/imgs/${widget.type == GenderType.boy ? 'boy' : 'girl'}.png',
              scale: 2.5,
            ),
          ),
        ),
      ),
    );
  }

  void _onClick() async {
    // First animation
    size = 80;
    duration = 250;
    color = Colors.blue;
    curve = Curves.fastLinearToSlowEaseIn;
    setState(() {});
    await Future.delayed(
      Duration(milliseconds: 270),
    );
    // Second animation
    curve = Curves.easeInCirc;
    duration = 180;
    size = 200;
    color = Colors.green;
    setState(() {});
  }
}
