import 'package:flutter/material.dart';

import '../../background.dart';
import '../../responsive.dart';
import 'components/search_btn.dart';
import 'components/search_image.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Expanded(
                  child: SearchImage(),
                ),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: SearchBtn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: MobileSearchScreen(),
          ),
        ),
      ),
    );
  }
}

class MobileSearchScreen extends StatelessWidget {
  const MobileSearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SearchImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: SearchBtn(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
