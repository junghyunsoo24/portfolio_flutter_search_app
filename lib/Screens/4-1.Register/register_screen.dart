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
  final TextEditingController _controller = TextEditingController();
  Future<String>? _futureResponse;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: (_futureResponse == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Text'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureResponse = enrollText(_controller.text);
            });
          },
          child: const Text('Enroll Text'),
        ),
      ],
    );
  }

  FutureBuilder<String> buildFutureBuilder() {
    return FutureBuilder<String>(
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
    );
  }
}

Future<String> enrollText(String text) async {
  final response = await http.post(
    Uri.parse('http://172.30.67.135:3001/enrollText'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'text': text,
    }),
  );

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, return success.
    return 'success';
  } else {
    // If the server does not return a 200 OK response, throw an exception.
    throw Exception('Failed to enroll text.');
  }
}
