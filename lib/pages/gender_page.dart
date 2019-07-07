import 'package:flutter/material.dart';
import 'package:register_demo/pages/hoppies_page.dart';
import 'package:register_demo/static_data/gender_type.dart';
import 'package:register_demo/static_data/static_colors.dart';
import 'package:register_demo/static_data/static_font_styles.dart';
import 'package:register_demo/static_data/static_methods.dart';
import 'package:register_demo/ui_components/my_avatar.dart';

class GenderPage extends StatelessWidget {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
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

  MyAvatar boy = MyAvatar();
  Widget _buildBody() {
    return Column(
      children: <Widget>[
        _buildSubtitle(),
        _buildTitle(),
        SizedBox(height: 32),
        Expanded(child: boy),
        SizedBox(height: 32),
        Expanded(child: MyAvatar(type: GenderType.girl, tag: 'girl')),
        SizedBox(height: 64),
        _buildNextButton(),
        SizedBox(height: 10),
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

  Widget _buildNextButton() {
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black.withOpacity(.25),
        ),
      ),
      child: FlatButton(
        onPressed: next,
        child: Text('Next', style: MyFontStyles.nextStyle),
        splashColor: MyColors.btnSplash,
      ),
    );
  }

  void next() {
    boy.clicked = true;
    StaticMethods.goTo(context, HoppiesPage(avatar: boy));
  }
}
