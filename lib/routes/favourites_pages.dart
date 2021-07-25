import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  final String _title;
  const FavouritePage(this._title);

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
