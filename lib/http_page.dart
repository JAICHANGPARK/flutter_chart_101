import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as json;
import 'package:http/http.dart' as http;

class HttpTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpTest(),
    );
  }
}

class HttpTest extends StatefulWidget {
  @override
  _HttpTestState createState() => _HttpTestState();
}

class _HttpTestState extends State<HttpTest> {
  // 함수
  // 비동기 처리
  Future<String> getData() async {
    var response = await http.get(Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
    headers: {
      "Accept" : "application/json"
    });
    print(response.body);

    List data = json.jsonDecode(response.body);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: getData,
          child: Text("get Data"),
        ),
      ),
    );
  }
}
