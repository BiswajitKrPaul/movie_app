import 'package:bloc/bloc.dart';
import 'package:movie_app/models/movie_item.dart';
import 'package:movie_app/repository/search_movie_repository.dart';
part 'movie_item_event.dart';
part 'movie_item_state.dart';

class MovieItemBloc extends Bloc<MovieItemEvent, MovieItemState> {
  final MovieRepository movieRepository;
  MovieItemBloc(this.movieRepository) : super(MovieItemInitial()) {
    on<GetMovieData>(
      (event, emit) async {
        emit(MovieItemInitial());
        try {
          final movieData = await movieRepository.getMovieDetails(event.id);
          emit(MovieItemLoaded(movieData: movieData));
        } catch (e) {
          emit(MovieItemError(error: e.toString()));
        }
      },
    );
  }
}
