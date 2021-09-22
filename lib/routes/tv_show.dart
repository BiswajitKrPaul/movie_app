import 'package:flutter/material.dart';

class TvShow extends StatelessWidget {
  final String title;

  const TvShow({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        centerTitle: false,
      ),
    );
  }
}
