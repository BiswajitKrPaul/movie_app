import 'package:flutter/material.dart';

class MovieHome extends StatelessWidget {
  final String _title;
  const MovieHome(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
        ),
        centerTitle: false,
      ),
    );
  }
}
