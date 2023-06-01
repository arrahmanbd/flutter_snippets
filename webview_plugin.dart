import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class WebViewExample extends StatefulWidget {
  const WebViewExample({Key key}) : super(key: key);

  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    this._controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = 'www.google.com';
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
            height: 50,
            child: TextField(
              controller: this._controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter URL to open it in webview.',
                labelText: 'URL to open',
              ),
            ),
          ),
        ),
        ButtonBar(
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.open_in_new),
              label: Text('Open in webview'),
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                this._openInWebview('https://${this._controller.text}');
              },
            ),
          ],
        ),
      ],
    );
  }

  Future<Null> _openInWebview(String url) async {
    if (await url_launcher.canLaunch(url)) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => WebviewScaffold(
            initialChild: Center(child: CircularProgressIndicator()),
            url: url,
            appBar: AppBar(title: Text(url)),
          ),
        ),
      );
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('URL $url can not be launched.'),
        ),
      );
    }
  }
}
