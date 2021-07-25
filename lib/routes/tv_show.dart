import 'package:flutter/material.dart';

class TvShow extends StatelessWidget {
  final String _title;
  const TvShow(this._title);

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
