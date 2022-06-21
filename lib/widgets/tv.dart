import 'package:flutter/material.dart';
import 'package:netflix/Ui/description_for_tv.dart';
import 'package:netflix/utls/text.dart';

class Tvmost extends StatelessWidget {
  final List tv;

  const Tvmost({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Texts(
            text: 'Popular On Netflix',
            size: 18,
            color: Colors.white,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => Descriptionpage2(
                              first_air_date:tv[index]['first_air_date'],
                              banner: 'https://image.tmdb.org/t/p/w500' +
                                  tv[index]['backdrop_path'],
                              description: tv[index]['overview'],
                              name: tv[index]['original_name'],
                              posterurl: 'https://image.tmdb.org/t/p/w500' +
                                  tv[index]['poster_path'],
                              vote:tv[index]['vote_average'].toString() )));
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
                                            tv[index]['poster_path']))),
                          ),
                          Texts(
                            text: tv[index]['original_name'] != null
                                ? tv[index]['original_name']
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
