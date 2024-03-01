import 'package:flutter/material.dart';
class Blog extends StatelessWidget {
  const Blog({super.key});

  Card buildCard() {
    var heading = 'Blog';
    
    var subheading = 'Author: Gigamike';

    var cardImage = const NetworkImage(
       'https://source.unsplash.com/random/800x600?house');

    var supportingText =
       'Beautiful home to rent, recently refurbished with modern appliances...';
    
    return Card(
       elevation: 4.0,
       child: Column(
         children: [
           ListTile(
             title: Text(heading),
             subtitle: Text(subheading),
           ),
           const SizedBox(height: 8), 
           
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
           ),
            
         ],
       )
    );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
      ),
      body: Container(
         padding: const EdgeInsets.all(16.0),
         child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
             child: Column(
              children: <Widget>[
                 Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: buildCard(),
                 ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: buildCard(),
                 ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: buildCard(),
                 ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: buildCard(),
                 ),
                 Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: buildCard(),
                 ),
              ],
             ),
         ),
      ),
    );
  }
}
