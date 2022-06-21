import 'package:flutter/material.dart';

class VerticalIconbutton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const VerticalIconbutton(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Column(
        children: [
        Icon(icon,color: Colors.white,),
        const SizedBox(height: 2.0,),
        Text(title,
        style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.white),)
      ]),
    );
  }
}
