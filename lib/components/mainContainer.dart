import 'package:flutter/material.dart';
import 'package:randomizer_project/services/randomizerModel.dart';
import '../constants.dart';

class BuildContainer extends StatelessWidget {
  const BuildContainer({
    Key key,
    this.response,
    this.info,
    this.title,
  });

  final Future<ResultModel> response;
  final String title;
  final Widget info;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Text(
                title,
                style: kTextTitleStyle,
              ),
            ),
            Expanded(flex: 4, child: info)
          ],
        ),
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black,
      //       spreadRadius: 1,
      //     ),
      //   ],
      // ),
    );
  }
}
