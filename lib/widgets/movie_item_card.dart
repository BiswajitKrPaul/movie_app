import 'package:flutter/material.dart';

class MovieItemCardView extends StatelessWidget {
  final int index;
  const MovieItemCardView(
      {required this.index,
      this.movieName = 'Harry Potter and the Goblet of Fire'});
  final String movieName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => debugPrint(index.toString()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Stack(
          children: [
            //Back Ground Item
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Container(
                height: 180,
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
                                        .headline1,
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '9/10',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                ),
                              ],
                            ),
                            Flexible(
                              child: Text(
                                'Director: ABSBSBSBS',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ),
                            Text(
                              'Starring: ABSBSBSBS',
                              style:
                                  Theme.of(context).primaryTextTheme.headline3,
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                width: 150,
                height: 190,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://creativereview.imgix.net/content/uploads/2019/12/joker_full.jpg?auto=compress,format&q=60&w=1012&h=1500'),
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
