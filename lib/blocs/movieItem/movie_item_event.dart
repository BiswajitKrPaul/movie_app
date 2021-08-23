part of 'movie_item_bloc.dart';

abstract class MovieItemEvent {}

class GetMovieData extends MovieItemEvent {
  String id;
  GetMovieData({
    required this.id,
  });
}
