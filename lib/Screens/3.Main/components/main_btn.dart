import 'package:flutter/material.dart';

import '../../../constants.dart';

class MainBtn extends StatelessWidget {
  const MainBtn({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const RegisterScreen();
                },
              ),
            );
          },
          child: Text(
            "Register".toUpperCase(),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SearchScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryLightColor,
            elevation: 0,
          ),
          child: Text(
            "Search".toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}