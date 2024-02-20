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
  Future<List<dynamic>>? _futureResponse;

  Future<List<dynamic>> _sBertResultText(String text) async {
    final response = await http.post(
      Uri.parse(UriHelper.getSBertSearchUri(context)),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'query': text,
      }),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> _cosResultText(String text) async {
    final response = await http.post(
      Uri.parse(UriHelper.getCosSearchUri(context)),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'query': text,
      }),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
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
              child: const Text('SBert'),
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
              child: const Text('Cos'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _futureResponse,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('에러: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final List<dynamic> data = snapshot.data!;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final document = data[index]['document'];
                        final similarity = data[index]['similarity'];
                        return ListTile(
                          title: Text('$document'),
                          subtitle: Text('Similarity: $similarity'),
                        );
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
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
