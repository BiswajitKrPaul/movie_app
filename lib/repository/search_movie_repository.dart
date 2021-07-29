import 'package:http/http.dart' as http;
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/models/search_movie_item.dart';

abstract class MovieRepository {
  Future<SearchMovieItem> searchPopularMovie(String pageno);
  Future<SearchMovieItem> searchUpcomingMovie(String pageno);
}

class MovieItem extends MovieRepository {
  List<Result> movieList = [];

  @override
  Future<SearchMovieItem> searchPopularMovie(String pageno) async {
    try {
      final Uri uri = Uri.parse('$kApiURL$kPopularMovieURL?page=$pageno');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final extractedData = searchMovieItemFromJson(response.body);
        return extractedData;
      } else {
        throw Exception('Could Not Retrieve Data');
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<SearchMovieItem> searchUpcomingMovie(String pageno) async {
    try {
      final Uri uri = Uri.parse('$kApiURL$kUpcomingMovieURL?page=$pageno');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final extractedData = searchMovieItemFromJson(response.body);
        return extractedData;
      } else {
        throw Exception('Could Not Retrieve Data');
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
