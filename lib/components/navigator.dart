import 'package:flutter/material.dart';
import 'package:randomizer_project/constants.dart';

class NavigatorWidget extends StatelessWidget {
  final Function ontap;
  final String textTitle;
  final IconData icon;

  NavigatorWidget({this.ontap, this.textTitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: iconAndTextWidget(
        icon: icon,
        text: textTitle,
      ),
    );
  }
}

Widget iconAndTextWidget({@required icon, @required text}) {
  return Column(
    children: [
      Icon(
        icon,
        size: 50,
      ),
      Text(
        text,
        style: kTextHomeStyle,
      )
    ],
  );
}
