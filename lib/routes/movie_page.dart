import 'package:flutter/material.dart';
import 'package:movie_app/constants/theme.dart';
import 'package:movie_app/widgets/movie_item_card.dart';

class MovieHome extends StatelessWidget {
  final String _title;
  const MovieHome(this._title);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _title,
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
        body: TabBarView(children: [
          ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return MovieItemCardView(
                index: index,
              );
            },
          ),
          const Center(
            child: Text('Tab 2'),
          ),
        ]),
      ),
    );
  }
}
