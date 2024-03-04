import 'package:flutter/material.dart';

import 'dart:math';
class Portfolio extends StatefulWidget {
  const Portfolio({super.key});
  
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<Portfolio> {
  Card buildCard() {
    var ran = Random();
    var heading = '\$${(ran.nextInt(20) + 15).toString()}00 per month';
    var subheading =
        '${(ran.nextInt(3) + 1).toString()} bed, ${(ran.nextInt(2) + 1).toString()} bath, ${(ran.nextInt(10) + 7).toString()}00 sqft';
    var cardImage = NetworkImage('https://source.unsplash.com/random/800x600?house&' +
            ran.nextInt(100).toString());
    var supportingText = 'Beautiful home to rent, recently refurbished with modern appliances...';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),
              subtitle: Text(subheading),
            ),
            Container(
              height: 200.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(supportingText),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('LEARN MORE'),
                  onPressed: () {/* ... */},
                )
              ],
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: Container(
         child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/portfolio.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: const EdgeInsets.all(90),
                ),

                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: buildCard(),
                ),

                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: buildCard(),
                ),

                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: buildCard(),
                ),

                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: buildCard(),
                ),

                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: buildCard(),
                ),
                
              ],
             ),
         ),
      ),
    );
  }
}