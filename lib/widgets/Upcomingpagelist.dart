import 'package:flutter/material.dart';

class Upcomingmoviespage extends StatelessWidget {
  final List upcoming;
  

   Upcomingmoviespage({Key? key, required this.upcoming,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: upcoming.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            upcoming[index]['backdrop_path']))),
                          ),
                          // const SizedBox(height: 10,),
                          // Container(
                          //   padding: const EdgeInsets.all(10),
                          //   child: Texts(
                          //     text: name != null ? name : 'Not loadeed',
                          //     size: 24,
                          //     color: Colors.white,
                          //   ),
                          // ),
          //                  Row(
          //   children: [
          //     Flexible(
          //       child: Texts(text: description, size: 15, color: Colors.white),
          //     )
          //   ],
          // )
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
