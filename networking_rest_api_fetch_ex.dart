import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestApiFetchExample extends StatefulWidget {
  const RestApiFetchExample({Key key}) : super(key: key);

  @override
  _RestApiFetchExampleState createState() => _RestApiFetchExampleState();
}

class _RestApiFetchExampleState extends State<RestApiFetchExample> {
  TextEditingController _urlController;
  TextEditingController _apiTokenController;
  String _responseBody = '<empty>';
  String _error = '<none>';
  bool _pending = false;

  @override
  void initState() {
    super.initState();
    this._apiTokenController = TextEditingController();
    this._urlController = TextEditingController()
      ..text = 'https://jsonplaceholder.typicode.com/posts/1';
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        TextField(
          controller: this._urlController,
          decoration: InputDecoration(
            labelText: 'URL to GET',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 4),
        TextField(
          controller: this._apiTokenController,
          decoration: InputDecoration(
            labelText: 'Optional api token',
            border: OutlineInputBorder(),
          ),
        ),
        ButtonBar(
          children: <Widget>[
            RaisedButton(
              child: Text('Get'),
              onPressed: _pending
                  ? null
                  : () => this
                      ._httpGet(_urlController.text, _apiTokenController.text),
            ),
            RaisedButton(
              onPressed: this._reset,
              child: Text('Reset'),
            ),
          ],
        ),
        Text('Response body=$_responseBody'),
        Divider(),
        Text('Error=$_error'),
      ],
    );
  }

  void _reset({bool resetControllers = true}) {
    setState(() {
      if (resetControllers) {
        this._urlController.text =
            'https://jsonplaceholder.typicode.com/posts/1';
      }
      this._responseBody = '<empty>';
      this._error = '<none>';
      this._pending = false;
    });
  }

  // Using the http package we can easily GET data from REST APIs.
  Future<Null> _httpGet(String url, String apiToken) async {
    _reset();
    setState(() => this._pending = true);
    try {
      final http.Response response = await http.get(
        url,
        headers: {HttpHeaders.authorizationHeader: apiToken},
      );
      final parsed = await compute(jsonDecode, response.body);
      print('parsed json object=$parsed');
      setState(() => this._responseBody = response.body);
    } catch (e) {
      setState(() => this._error = e.toString());
    }
    setState(() => this._pending = false);
  }
}
