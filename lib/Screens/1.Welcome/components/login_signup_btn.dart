import 'package:flutter/material.dart';

import '../../2.Login/login_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({Key? key,}) : super(key: key);

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
                  return const LoginScreen(title: 'kakao login',);
                },
              ),
            );
          },
          child: Text(
            "Login".toUpperCase(),
          ),
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}