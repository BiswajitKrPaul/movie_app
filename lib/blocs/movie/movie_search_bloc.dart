import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/models/search_movie_item.dart';
import 'package:movie_app/repository/search_movie_repository.dart';

part 'movie_search_event.dart';
part 'movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final MovieRepository movieRepository;
  late List<Result> movieList;
  MovieSearchBloc({required this.movieRepository})
      : super(const MovieSearchInitial([], 1)) {
    on<PopularMovieSearch>(
      (event, emit) async {
        if (event is PopularMovieSearch) {
          try {
            final movies = await movieRepository
                .searchPopularMovie(event.oldPage.toString());
            movieList = [...state.movieItems, ...movies.results];
            emit(MovieSearchResults(
                moviesList: movieList,
                pageno: movies.page,
                totalpage: movies.totalPages));
          } catch (err) {
            emit(MovieSearchError());
          }
        }
      },
    );
  }
}
