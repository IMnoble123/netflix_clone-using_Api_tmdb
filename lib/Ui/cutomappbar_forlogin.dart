import 'package:flutter/material.dart';

class Loginappbar extends StatelessWidget {
  const Loginappbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.black,
      child: SafeArea(
        child: Row(
          children: const [
             Expanded(
               child: Image(
                  image:AssetImage('assets/netflix-logofor_project-removebg-preview.png')),
             ),
          ],
        ),
      )
    );
  }
}