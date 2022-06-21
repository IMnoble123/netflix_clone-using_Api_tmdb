import 'package:flutter/material.dart';
import 'package:netflix/Ui/description_page.dart';
import 'package:netflix/utls/text.dart';

class Trendingmovies extends StatelessWidget {
  final List trending;

  const Trendingmovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Texts(
            text: 'Trending Movies',
            size: 18,
            color: Colors.white,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        // print('release date');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => Descriptionpage(
                                  name: trending[index]['title'],
                                  banner: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['backdrop_path'],
                                  vote: trending[index]['vote_average']
                                      .toString(), posterurl:'https://image.tmdb.org/t/p/w500' +trending[index]['poster_path'], description:  trending[index]['overview'],  launch_on: trending[index]['release_date'],
                                
                                )));

                      },
                      child: trending[index]['title'] != null
                          ? SizedBox(
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://image.tmdb.org/t/p/w500' +
                                                    trending[index]
                                                        ['poster_path']))),
                                  ),
                                  Texts(
                                    text: trending[index]['title'] != null
                                        ? trending[index]['title']
                                        : 'loading',
                                    color: Colors.white,
                                    size: 10,
                                  )
                                ],
                              ),
                            )
                          : Container());
                }),
          ),
        ],
      ),
    );
  }
}
