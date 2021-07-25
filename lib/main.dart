import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/constants/theme.dart';
import 'package:movie_app/routes/homepage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: basicTheme(),
      home: const HomePage(),
    );
  }
}
