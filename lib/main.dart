import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constants/theme.dart';
import 'package:movie_app/repository/search_movie_repository.dart';
import 'package:movie_app/routes/homepage.dart';
import 'blocs/movie/movie_search_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light, // status bar color
  ));
  runApp(BlocProvider(
    create: (context) => MovieSearchBloc(movieRepository: MovieItem()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: basicTheme(),
      home: const HomePage(),
    );
  }
}
