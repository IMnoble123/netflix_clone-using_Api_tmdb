import 'package:flutter/material.dart';
import 'package:netflix/utls/text.dart';

class Descriptionpage extends StatelessWidget {
  const Descriptionpage({
    Key? key,
    required this.name,
    required this.banner,
    required this.vote,
    required this.posterurl,
    required this.description,
    required this.launch_on
  }) : super(key: key);
  final dynamic name, banner, vote, posterurl, description,launch_on;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(children: [
              Positioned(
                  child: SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  banner,
                  fit: BoxFit.cover,
                ),
              )),
              Positioned(
                  bottom: 10,
                  child: Texts(
                      text: ' ⭐Rating -' + vote,
                      color: Colors.white,
                      size: 15)),
            ]),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Texts(
              text: name != null ? name : 'Not loadeed',
              size: 24,
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Texts(
              text: 'Releasing On - ' + launch_on,
              size: 14,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Texts(text: description, size: 15, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
