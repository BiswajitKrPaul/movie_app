import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/models/search_movie_item.dart';
import 'package:movie_app/repository/search_movie_repository.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final MovieRepository movieRepository;
  late List<Result> movieList;
  PopularMovieBloc({required this.movieRepository})
      : super(const PopularMovieInitial([], 1)) {
    on<UpcomingMovieSearch>(
      (event, emit) async {
        try {
          final movies = await movieRepository
              .searchUpcomingMovie(event.oldPage.toString());
          movieList = [...state.movieItems, ...movies.results];
          emit(UpcomingMovieResult(
              moviesList: movieList,
              pageno: movies.page,
              totalpage: movies.totalPages));
        } catch (err) {
          emit(PopularMovieError());
        }
      },
    );
  }
}
