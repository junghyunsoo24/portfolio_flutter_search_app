import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../uri_helper.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  Future<void>? _futureResponse;

  Future<void> _sBertResultText(String text) async {
    final response = await http.post(
      Uri.parse(UriHelper.getSBertSearchUri(context)),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'text': text,
      }),
    );

    if(!mounted) return;

    if (response.statusCode == 201) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('성공'),
          content: const Text('텍스트를 성공적으로 불러왔습니다!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('확인'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('실패'),
          content: const Text('텍스트를 불러오지 못했습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('확인'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _cosResultText(String text) async {
    final response = await http.post(
      Uri.parse(UriHelper.getCosSearchUri(context)),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'text': text,
      }),
    );

    if(!mounted) return;

    if (response.statusCode == 201) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('성공'),
          content: const Text('텍스트를 성공적으로 불러왔습니다!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('확인'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('실패'),
          content: const Text('텍스트를 불러오지 못했습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('확인'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
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
                    _futureResponse = _sBertResultText(enteredText);
                  });
                } else {
                  if (kDebugMode) {
                    print('찾을 텍스트를 입력하세요.');
                  }
                }
              },
              child: const Text('sbert로 찾기'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final enteredText = _textEditingController.text;
                if (enteredText.isNotEmpty) {
                  setState(() {
                    _futureResponse = _cosResultText(enteredText);
                  });
                } else {
                  if (kDebugMode) {
                    print('찾을 텍스트를 입력하세요.');
                  }
                }
              },
              child: const Text('다른 목적으로 찾기'),
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