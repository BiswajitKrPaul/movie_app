import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/routes/movie/movie_screen.dart';

class MovieItemCardView extends StatelessWidget {
  final int index;
  final String movieName;
  final String imageUrl;
  final String rating;
  final String releaseDate;
  final String overView;
  final String id;

  const MovieItemCardView({
    required this.index,
    required this.movieName,
    required this.imageUrl,
    required this.rating,
    required this.releaseDate,
    required this.overView,
    required this.id,
  });

  void onClick(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MovieScreen.routeName, arguments: {'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Stack(
          children: [
            //Back Ground Item
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                height: 150,
                width:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? MediaQuery.of(context).size.width * .9
                        : MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 14,
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      flex: 20,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    movieName,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline5,
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  rating == '0.0' ? 'NA' : rating,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Flexible(
                              child: Text(
                                '($releaseDate)',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                overView,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3,
                                //softWrap: false,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Poster Item
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 120,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: imageUrl == ''
                        ? const NetworkImage(
                            'https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227724992-stock-illustration-image-available-icon-flat-vector.jpg')
                        : NetworkImage('$kPosterURL$imageUrl'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
