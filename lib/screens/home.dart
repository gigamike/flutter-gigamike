import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:gigamike/widgets/about_grid_item.dart';
import 'package:gigamike/widgets/services_grid_item.dart';
import 'package:gigamike/widgets/certifications_grid_item.dart';
import 'package:gigamike/widgets/portfolio_grid_item.dart';
import 'package:gigamike/widgets/blog_grid_item.dart';
import 'package:gigamike/widgets/contact_grid_item.dart';
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
            Expanded(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: const <Widget>[
                    AboutGridItem(),
                    ServicesGridItem(),
                    CertificationsGridItem(),
                    PortfolioGridItem(),
                    BlogGridItem(),
                    ContactGridItem(),
                  ],
              ),
            ),

          ],
        ),
    );
  }
}
