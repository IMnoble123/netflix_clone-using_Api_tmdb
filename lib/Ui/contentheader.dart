import 'package:flutter/material.dart';
import 'package:netflix/Ui/verticalbutton.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/strangerthingsmain.jpg'),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconbutton(
                    icon: Icons.add, title: 'My List', onTap: () {}),
                const Playbutton(),
                VerticalIconbutton(
                    icon: Icons.info, title: 'info', onTap: () {}),
              ],
            ))
      ],
    );
  }
}

class Playbutton extends StatelessWidget {
  const Playbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.play_arrow,color: Colors.white,),
        label: const Text(
          'Play',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600,color: Colors.white),
        ));
  }
}
