import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double kInputHeight = 40;
const double kResultHeight = 290;
const kTextHomeStyle = TextStyle(fontSize: 20, color: Colors.black);
const kTextTitleStyle = TextStyle(
  fontSize: 20,
  color: Color(0xFF52616B),
  fontWeight: FontWeight.w500,
);
const kTextResultStyle = TextStyle(fontSize: 30, color: Color(0xFF52616B));
const kButtonHeightContainer = 20.0;

final List<String> menu = [
  'Random Picker',
  'Custom List',
  'Decision Maker',
  'Name Picker',
  'Team Generator',
  'Yes or No'
];

final List<IconData> icon = [
  FontAwesomeIcons.dice,
  FontAwesomeIcons.list,
  FontAwesomeIcons.mapPin,
  FontAwesomeIcons.userCog,
  FontAwesomeIcons.users,
  FontAwesomeIcons.angellist,
];
