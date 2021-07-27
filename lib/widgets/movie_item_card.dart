import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';

class MovieItemCardView extends StatelessWidget {
  final int index;
  final String movieName;
  final String imageUrl;
  final String rating;

  const MovieItemCardView({
    required this.index,
    required this.movieName,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => debugPrint(index.toString()),
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
                      flex: 3,
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  rating,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Flexible(
                              child: Text(
                                'Director: Nates',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                'Starring: Eddie/Therine',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3,
                                softWrap: false,
                                maxLines: 1,
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
                  color: Colors.green,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage('$kPosterURL$imageUrl'),
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
