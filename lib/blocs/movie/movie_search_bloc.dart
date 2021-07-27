import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/repository/search_movie_repository.dart';

part 'movie_search_event.dart';
part 'movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final MovieRepository movieRepository;

  MovieSearchBloc({required this.movieRepository})
      : super(MovieSearchInitial());

  @override
  Stream<MovieSearchState> mapEventToState(
    MovieSearchEvent event,
  ) async* {
    if (event is PopularMovieSearch) {
      yield const MovieSearchLoading();
      try {
        final movies = await movieRepository.searchPopularMovie();
        yield MovieSearchResults(moviesList: movies);
      } catch (err) {
        yield MovieSearchError(err.toString());
      }
    } else if (event is PopularMovieMoreSearch) {
      final movies = await movieRepository.searchPopularMovie();
      yield MovieSearchResults(moviesList: movies);
    }
  }
}
