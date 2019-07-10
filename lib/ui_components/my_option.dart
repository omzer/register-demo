import 'package:flutter/material.dart';
import 'package:register_demo/pages/hoppies_page.dart';
import 'package:register_demo/static_data/static_font_styles.dart';

class MyOption extends StatefulWidget {
  final String optionText;
  MyOption({
    this.optionText = 'nothin',
  });
  @override
  _MyOptionState createState() => _MyOptionState();
}

class _MyOptionState extends State<MyOption> {
  Color _backgroundColor = Colors.grey.withOpacity(.7);
  Color _backgroundColorClicked = Colors.indigo;
  bool isClicked = false;
  double size = 80;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clicked,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        curve: Curves.easeIn,
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isClicked ? _backgroundColorClicked : _backgroundColor,
        ),
        child: Center(
          child: Text(widget.optionText, style: MyFontStyles.optionStyle),
        ),
      ),
    );
  }

  void clicked() async {
    if (HoppiesPage.count >= 3 && !isClicked) return;
    setState(() {
      if (isClicked) {
        HoppiesPage.count--;
      } else {
        HoppiesPage.count++;
      }
      isClicked = !isClicked;
      size = 120;
    });
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      size = 80;
    });
  }
}
