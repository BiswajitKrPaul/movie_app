import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movie_app/models/movie_item.dart';
import 'package:movie_app/repository/search_movie_repository.dart';
part 'movie_item_event.dart';
part 'movie_item_state.dart';

class MovieItemBloc extends Bloc<MovieItemEvent, MovieItemState> {
  final MovieRepository movieRepository;
  MovieItemBloc(this.movieRepository) : super(MovieItemInitial());

  @override
  Stream<MovieItemState> mapEventToState(
    MovieItemEvent event,
  ) async* {
    if (event is GetMovieData) {
      yield MovieItemInitial();
      try {
        final movieData = await movieRepository.getMovieDetails(event.id);
        yield MovieItemLoaded(movieData: movieData);
      } catch (e) {
        yield MovieItemError(error: e.toString());
      }
    }
  }
}
