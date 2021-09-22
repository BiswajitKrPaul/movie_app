import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  final String title;
  const FavouritePage({
    Key? key,
    required this.title,
  }) : super(key: key);

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
