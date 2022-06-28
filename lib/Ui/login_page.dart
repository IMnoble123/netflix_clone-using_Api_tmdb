import 'package:flutter/material.dart';
import 'package:netflix/Ui/cutomappbar_forlogin.dart';
import 'package:netflix/nav_screen/bottom_nav.dart';
import 'package:netflix/utls/text.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size(ScreenSize.width, 80.0),
          child: const Loginappbar(),
        ),
        body: ListView(children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Texts(text: 'Sign In', color: Colors.white, size: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        cursorColor: Colors.grey.shade600,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.white38),
                          labelText: 'Email or phone number',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.grey.shade600,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.white38),
                          labelText: 'Password',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 1,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) =>const  Bottomnavigationbarpae()));
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          child: const Texts(
                            color: Colors.white,
                            text: 'Sign In',
                            size: 15,
                          )),
                    ),
                  ),
                  const SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Texts(text: 'Remember me', color: Colors.white38, size: 13),
                      Texts(text: 'Need help?', color: Colors.white38, size: 13)
                    ],
                  ),
                  const SizedBox(height: 8,),
                 Padding(
                   padding: const EdgeInsets.only(left: 50),
                   child: Row(
                    children: const [
                       Texts(text: 'New to Netflix?', color:Colors.white38, size: 13),
                    Texts(text: 'Sign Up now.', color: Colors.white, size: 15)
                    ],
                   ),
                 ),
                const  SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Texts(text: 'This page is protected by Google reCAPTCHA to ensure youre not a bot.', color: Colors.white38, size: 13),
                ),
                TextButton(onPressed: (){}, child: Texts(color: Colors.blue.shade600,text:'Learn more.',size: 13,))
      
                ],
              )
            ],
          ),
        ]));
  }
}
