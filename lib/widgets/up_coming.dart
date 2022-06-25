import 'package:flutter/material.dart';
import 'package:netflix/Ui/description_page.dart';
import 'package:netflix/utls/text.dart';

class Upcomingmovies extends StatelessWidget {
  final List upcoming;

  const Upcomingmovies({Key? key, required this.upcoming}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Texts(
            text: 'Up coming Movies',
            size: 18,
            color: Colors.white,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: upcoming.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => Descriptionpage(
                                name: upcoming[index]['title'],
                                banner: 'https://image.tmdb.org/t/p/w500' +
                                    upcoming[index]['backdrop_path'],
                                vote:
                                    upcoming[index]['vote_average'].toString(),
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    upcoming[index]['poster_path'],
                                description: upcoming[index]['overview'],
                                launch_on: upcoming[index]['release_date'],
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
                                            upcoming[index]['poster_path']))),
                          ),
                          Texts(
                            text: upcoming[index]['title'] != null
                                ? upcoming[index]['title']
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
