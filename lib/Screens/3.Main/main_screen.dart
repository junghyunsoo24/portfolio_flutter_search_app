import 'package:flutter/material.dart';

import '../../background.dart';
import '../../responsive.dart';
import 'components/Main_btn.dart';
import 'components/main_image.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MainImage(),
                SizedBox(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 600,
                        child: MainBtn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: MobileMainScreen(),
            tablet: TabletMainScreen(),
          ),
        ),
      ),
    );
  }
}

class MobileMainScreen extends StatelessWidget {
  const MobileMainScreen({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MainImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: MainBtn(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class TabletMainScreen extends StatelessWidget {
  const TabletMainScreen({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MainImage(),
        SizedBox(
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: MainBtn(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}