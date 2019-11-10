import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubsearch/pages/repository_page.dart';

import 'pages/details_page.dart';
import 'pages/home_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return CupertinoPageRoute(
        builder: (_) => HomePage(),
      );
    case '/details':
      return CupertinoPageRoute(
        builder: (_) => DetailsPage(settings.arguments),
      );
    case '/details/repository':
      return CupertinoPageRoute(
        builder: (_) => RepositoryPage(settings.arguments),
      );
    default:
      return CupertinoPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
