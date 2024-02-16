import 'package:flutter/material.dart';

import '../Main/main_screen.dart';
import 'kakao_login.dart';
import 'main_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final viewModel = MainViewModel(KakaoLogin());

  @override
  void initState() {
    super.initState();
    _autoLogin();
  }

  void _autoLogin() async {
    await viewModel.login();
    setState(() {
      // 추가: 로그인이 성공하면 화면 전환
      if (viewModel.isLogined) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()), // SearchScreen으로 이동
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${viewModel.isLogined}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
