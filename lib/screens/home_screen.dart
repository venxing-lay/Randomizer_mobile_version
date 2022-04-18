import 'package:flutter/material.dart';
import 'package:randomizer_project/components/navigator.dart';
import 'package:randomizer_project/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Randomizer',
            style: TextStyle(
              color: Color(0xFF52616B),
              fontSize: 30,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NavigatorWidget(
                        icon: icon[0],
                        textTitle: menu[0],
                        ontap: () {
                          Navigator.pushNamed(context, '/randompicker');
                        },
                      ),
                      NavigatorWidget(
                        icon: icon[1],
                        textTitle: menu[1],
                        ontap: () {
                          Navigator.pushNamed(context, '/custlist');
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NavigatorWidget(
                        icon: icon[2],
                        textTitle: menu[2],
                        ontap: () {
                          Navigator.pushNamed(context, '/randompicker');
                        },
                      ),
                      NavigatorWidget(
                        icon: icon[3],
                        textTitle: menu[3],
                        ontap: () {
                          Navigator.pushNamed(context, '/randompicker');
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NavigatorWidget(
                        icon: icon[4],
                        textTitle: menu[4],
                        ontap: () {
                          Navigator.pushNamed(context, '/teamgenerator');
                        },
                      ),
                      NavigatorWidget(
                        icon: icon[5],
                        textTitle: menu[5],
                        ontap: () {
                          Navigator.pushNamed(context, '/randompicker');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
