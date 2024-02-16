import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  Future<void> _saveText(String text) async {
    final url = Uri.parse('http://localhost:3000/enrollText');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: {'text': text},
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
                  _saveText(enteredText);
                } else {
                  print('텍스트를 입력하세요.');
                }
              },
              child: const Text('저장'),
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
