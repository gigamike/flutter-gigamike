import 'package:flutter/material.dart';

import 'package:gigamike/screens/services.dart';

class ServicesGridItem extends StatelessWidget{
  const ServicesGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xff1e3c72), Color(0xff2a5298)],
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
        ),
      ),
      child: InkWell(
        onTap: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const Services()));
        },
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.emoji_objects,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 50.0,
            ), 
            Text(
              "Services",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}