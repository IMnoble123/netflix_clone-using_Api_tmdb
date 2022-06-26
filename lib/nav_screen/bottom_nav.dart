import 'package:flutter/material.dart';
import 'package:netflix/Ui/comming_Soon.dart';
import 'package:netflix/Ui/dawnloads.dart';
import 'package:netflix/Ui/fast_laughs.dart';
import 'package:netflix/Ui/home_page.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({Key? key}) : super(key: key);

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  int _currentIndex = 0;
  final List pages = [
    const HomePage(),
    const Commingsoon(),
    const Laugh(),
    const Dawnloads()


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
    body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        selectedFontSize: 11.0,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11.0,
        backgroundColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),backgroundColor: Colors.black,
               label: 'Home'
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.queue_play_next),
              label: 'Comming Soon',
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions),
              label: 'Fast Laughs'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.downloading),
                label: 'Dawnloads'
                )
          ]),
    );
  }
}
