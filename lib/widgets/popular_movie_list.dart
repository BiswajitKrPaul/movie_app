import 'package:flutter/material.dart';
import 'package:movie_app/models/search_movie_item.dart';
import 'package:movie_app/widgets/movie_item_card.dart';

class PopularMovieList extends StatefulWidget {
  final List<Result> movieList;
  final Function onLastItem;
  const PopularMovieList({required this.movieList, required this.onLastItem});

  @override
  _PopularMovieListState createState() => _PopularMovieListState();
}

class _PopularMovieListState extends State<PopularMovieList> {
  late ScrollController scrollController;

  void scrolitems() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      widget.onLastItem();
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrolitems);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: widget.movieList.length,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return MovieItemCardView(
          index: index,
          movieName: widget.movieList[index].originalTitle,
          imageUrl: widget.movieList[index].posterPath,
          rating: widget.movieList[index].voteAverage.toString(),
        );
      },
    );
  }
}
