import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/Ui/login_page.dart';
import 'package:netflix/nav_screen/bottom_nav.dart';

class lottiepage extends StatefulWidget {
  const lottiepage({Key? key}) : super(key: key);

  @override
  State<lottiepage> createState() => _lottiepageState();
}

class _lottiepageState extends State<lottiepage> {
  @override
  void initState() {
    gohome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/29313-netflix-logo-swoop.json',
              height: 300.0,
              animate: true,
              repeat: false,
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> gohome(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 6));
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => const Loginpage()));
}
