import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  Future<String>? _futureResponse;

  Future<void> _saveText(String text) async {
    final response = await http.post(
      Uri.parse('http://192.168.219.102:3002/enrollText'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'text': text,
      }),
    );

    if (response.statusCode == 200) {
      print('텍스트가 성공적으로 저장되었습니다.');
    } else {
      print('텍스트 저장에 실패했습니다. 상태 코드: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: '텍스트 입력',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final enteredText = _textEditingController.text;
                if (enteredText.isNotEmpty) {
                  setState(() {
                    _futureResponse = _saveText(enteredText) as Future<String>?;
                  });
                } else {
                  print('텍스트를 입력하세요.');
                }
              },
              child: const Text('저장'),
            ),
            if (_futureResponse != null)
              FutureBuilder<String>(
                future: _futureResponse,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('Response: ${snapshot.data}');
                  }
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}