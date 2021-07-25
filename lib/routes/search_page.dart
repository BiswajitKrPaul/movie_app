import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:movie_app/constants/theme.dart';

class SearchHome extends StatefulWidget {
  final String _title;
  const SearchHome(this._title);

  @override
  _SearchHomeState createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget._title,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Linecons.search),
                labelText: 'Search Movies or Tv Shows',
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryGrey),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            )
          ],
        ),
      ),
    );
  }
}
