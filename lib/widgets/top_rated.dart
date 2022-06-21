import 'package:flutter/material.dart';
import 'package:netflix/Ui/description_page.dart';
import 'package:netflix/utls/text.dart';

class Topratedmovies extends StatelessWidget {
  final List toprated;

  const Topratedmovies({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Texts(
            text: 'Top Rated movies',
            size: 18,
            color: Colors.white,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => Descriptionpage(
                                name: toprated[index]['title'],
                                banner: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['backdrop_path'],
                                vote:
                                    toprated[index]['vote_average'].toString(),
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['poster_path'],
                                description: toprated[index]['overview'],
                                launch_on: toprated[index]['release_date'],
                                //  first_air_date: toprated[index][' first_air_date'] ,
                              )));
                    },
                    child: SizedBox(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            toprated[index]['poster_path']))),
                          ),
                          Texts(
                            text: toprated[index]['title'] != null
                                ? toprated[index]['title']
                                : 'loading',
                            color: Colors.white,
                            size: 10,
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
