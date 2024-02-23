import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() {
    return _Home();
  }
}

class _Home extends State<Home>{
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print

    /*
    print('ready in 3...');
    
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    */
    
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gigamike.net'),
      ),
      body: 
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const SizedBox(width: 10),
                Container(
                    width: 100,
                    height: 100,
                    child: const Stack(
                      alignment: Alignment(0.6, 0.6),
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/mik.jpg'),
                          radius: 100,
                        ),
                      ],
                    ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text('Hello and welcome to my mobile app. I\'m Mik "Gigamike" Galon. What can I do for you?'),
                ),
                const SizedBox(width: 10),
              ],
            ),

            Expanded(
                child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
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
                        print('tap');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.account_circle_rounded,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ), 
                          Text(
                            "About",
                            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
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
                        print('tap');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.emoji_objects,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ), 
                          Text(
                            "Services",
                            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
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
                        print('tap');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.emoji_events,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ), 
                          Text(
                            "Certifications",
                            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
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
                        print('tap');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.developer_mode,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ), 
                          Text(
                            "Portfolio",
                            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
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
                        print('tap');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.library_books,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ), 
                          Text(
                            "Blog",
                            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
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
                        print('tap');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.contact_support,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ), 
                          Text(
                            "Contact Me",
                            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
    );
  }
}
