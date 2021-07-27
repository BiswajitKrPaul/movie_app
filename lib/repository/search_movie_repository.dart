import 'package:http/http.dart' as http;
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/models/search_movie_item.dart';

abstract class MovieRepository {
  Future<List> searchPopularMovie();
}

class MovieItem extends MovieRepository {
  List<Result> movieList = [];
  @override
  Future<List> searchPopularMovie() async {
    try {
      final Uri uri = Uri.parse('$kApiURL$kPopularMovieURL');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final extractedData = searchMovieItemFromJson(response.body);
        return movieList = movieList + [...extractedData.results];
      } else {
        throw Exception('Could Not Retrieve Data');
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
