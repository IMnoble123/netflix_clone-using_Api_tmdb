// import 'package:flutter/material.dart';

// class CustomAppBar extends StatelessWidget {
//   final double scrollOffset;
//   const CustomAppBar({Key? key,  this.scrollOffset = 0.0,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
//       color: Colors.black.withOpacity((scrollOffset/350).clamp(0,1).toDouble()),
//       child: SafeArea(
//         child: Row(
//           children: [
//              const Image(
//                 image:AssetImage('assets/netflix.png')),
//             const SizedBox(
//               width: 12.0,
//             ),
//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Appbarbutton(title: 'TV Shows', onTap: () {}),
//                   Appbarbutton(title: 'Movies', onTap: () {}),
//                   Appbarbutton(title: 'Categories', onTap: () {}),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Appbarbutton extends StatelessWidget {
//   final String title;
//   final Function onTap;
//   const Appbarbutton({Key? key, required this.title, required this.onTap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: Text(
//         title,
//         style: const TextStyle(
//             color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600),
//       ),
//     );
//   }
// }
