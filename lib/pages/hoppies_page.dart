import 'package:flutter/material.dart';
import 'package:register_demo/static_data/static_colors.dart';
import 'package:register_demo/static_data/static_font_styles.dart';
import 'package:register_demo/ui_components/my_avatar.dart';
import 'package:register_demo/ui_components/my_option.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class HoppiesPage extends StatefulWidget {
  static int count = 0;
  final MyAvatar avatar;
  HoppiesPage({
    @required this.avatar,
  });

  @override
  _HoppiesPageState createState() => _HoppiesPageState();
}

class _HoppiesPageState extends State<HoppiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      // appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          SizedBox(height: 16),
          _buildHeadline(),
          SizedBox(height: 8),
          _buildHeadlTitle(),
          SizedBox(height: 22),
          SizedBox(height: 130, width: 130, child: widget.avatar),
          SizedBox(height: 22),
          _buildOptions(),
          _buildProgressBar(),
        ],
      ),
    );
  }

  Widget _buildHeadline() => Text(
        'You can choose 3',
        style: MyFontStyles.subtitleStyle,
      );

  double _rotationValue = 1.55;
  Widget _buildHeadlTitle() {
    Text text = Text(
      'Please choose your hobbies',
      style: MyFontStyles.titleStyle,
      textAlign: TextAlign.center,
    );
    _playAnimation();
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      transform: Matrix4.identity()
        ..setEntry(1, 2, .02)
        ..rotateX(_rotationValue),
      alignment: FractionalOffset.center,
      child: text,
    );
  }

  void _playAnimation() async {
    await Future.delayed(Duration(milliseconds: 200));
    try {
      setState(() {
        _rotationValue = 0;
      });
    } catch (_) {}
  }

  Widget _buildOptions() {
    return Expanded(
      flex: 5,
      child: Wrap(
        spacing: 80,
        runSpacing: 20,
        children: <Widget>[
          MyOption(optionText: 'Design'),
          MyOption(optionText: 'Film'),
          MyOption(optionText: 'Painting'),
          MyOption(optionText: '3D'),
          MyOption(optionText: 'Software'),
          MyOption(optionText: 'Web'),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Expanded(
      flex: 1,
      child: FAProgressBar(
        currentValue: (100 * (HoppiesPage.count / 3.0)).toInt(),
        displayText: '%',
        backgroundColor: Colors.pink,
        progressColor: Colors.indigo,
        animatedDuration: Duration(milliseconds: 200),
        borderRadius: 25,
      ),
    );
  }
}
