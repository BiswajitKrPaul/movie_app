import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:movie_app/routes/favourites_pages.dart';
import 'package:movie_app/routes/movie_page.dart';
import 'package:movie_app/routes/search_page.dart';
import 'package:movie_app/routes/tv_show.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void onSelectedIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Color toogleColour(int pos) {
    if (currentIndex == pos) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Widget toogleScreen(int index) {
    switch (index) {
      case 0:
        return const MovieHome('MOVIES');
      case 1:
        return const TvShow('TV SHOWS');
      case 2:
        return const FavouritePage('FAVOURITES');
      case 3:
        return const SearchHome('SEARCH');
      default:
        return const MovieHome('MOVIES');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: toogleScreen(currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        items: [
          Icon(
            Iconic.video,
            size: 30,
            color: toogleColour(0),
          ),
          Icon(
            Linecons.tv,
            size: 30,
            color: toogleColour(1),
          ),
          Icon(
            Octicons.saved,
            size: 30,
            color: toogleColour(2),
          ),
          Icon(
            Linecons.search,
            size: 30,
            color: toogleColour(3),
          ),
        ],
        animationDuration: const Duration(milliseconds: 250),
        onTap: onSelectedIndex,
      ),
    );
  }
}
