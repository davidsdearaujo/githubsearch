import 'package:flutter/material.dart';
import 'package:githubsearch/models/repository_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RepositoryPage extends StatelessWidget {
  final RepositoryModel model;

  const RepositoryPage(this.model, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(model.name)),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: model.htmlUrl,
      ),
    );
  }
}
