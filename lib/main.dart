import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/movieItem/movie_item_bloc.dart';
import 'package:movie_app/constants/theme.dart';
import 'package:movie_app/repository/search_movie_repository.dart';
import 'package:movie_app/routes/homepage.dart';
import 'package:movie_app/routes/movie/movie_screen.dart';
import 'blocs/movie/movie_search_bloc.dart';
import 'blocs/popularmovies/popular_movie_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light, // status bar color
    ),
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieSearchBloc(
            movieRepository: MovieItemApI(),
          ),
        ),
        BlocProvider(
          create: (ctx) => PopularMovieBloc(
            movieRepository: MovieItemApI(),
          ),
        ),
        BlocProvider(
          create: (context) => MovieItemBloc(
            MovieItemApI(),
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: basicTheme(),
      home: const HomePage(),
      routes: {
        MovieScreen.routeName: (ctx) => const MovieScreen(),
      },
    );
  }
}
