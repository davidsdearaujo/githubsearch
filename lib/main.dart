import 'package:flutter/material.dart';

import 'routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Search',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: Color(0xff664EB8),
      ),
      initialRoute: "/",
      onGenerateRoute: generateRoute,
    );
  }
}
