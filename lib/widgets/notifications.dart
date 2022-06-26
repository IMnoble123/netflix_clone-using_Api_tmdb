import 'package:flutter/material.dart';

class NotificationBar extends StatelessWidget {
  const NotificationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.black,
          child: ListTile(
            leading: TextButton.icon(onPressed: (){}, icon: const Icon(Icons.notifications,color: Colors.red,),
             label: const Text('Notifications',style: TextStyle(fontSize: 15,color: Colors.white),)),
             trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 13,color: Colors.white,),

          ),
        )
      ],
    );
  }
}
