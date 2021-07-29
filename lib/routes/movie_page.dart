import 'package:flutter/material.dart';
import 'package:movie_app/constants/theme.dart';
import 'package:movie_app/widgets/popular_movie_list.dart';
import 'package:movie_app/widgets/upcoming_movie_list.dart';

class MovieHome extends StatefulWidget {
  final String _title;
  const MovieHome(this._title);

  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget._title,
          ),
          centerTitle: false,
          bottom: TabBar(
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 5, color: kPrimaryYellow),
              insets: EdgeInsets.only(left: 80, right: 90),
            ),
            labelColor: kPrimaryBlack,
            labelStyle: Theme.of(context).primaryTextTheme.headline1,
            unselectedLabelStyle: Theme.of(context).primaryTextTheme.headline2,
            tabs: const [
              Tab(
                text: 'Now Popular',
              ),
              Tab(
                text: 'The Upcoming',
              )
            ],
          ),
        ),
        body: const TabBarView(children: [
          PopularMovieList(),
          UpcomingMovieList(),
        ]),
      ),
    );
  }
}
