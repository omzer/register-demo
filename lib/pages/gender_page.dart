import 'package:flutter/material.dart';
import 'package:register_demo/static_data/static_colors.dart';
import 'package:register_demo/static_data/static_font_styles.dart';

class GenderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: MyColors.backgroundColor,
      elevation: 0,
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        _buildSubtitle(),
        _buildTitle(),
        SizedBox(height: 32),
        Expanded(child: Placeholder(color: Colors.red)),
        SizedBox(height: 32),
        Expanded(child: Placeholder(color: Colors.blue)),
        SizedBox(height: 64),
        Placeholder(fallbackHeight: 60, color: MyColors.titleFontColor),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'Let\'s get to know you better',
      style: MyFontStyles.subtitleStyle,
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Find products that are better for you',
        style: MyFontStyles.titleStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
