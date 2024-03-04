import 'package:flutter/material.dart';

import 'package:gigamike/screens/contact.dart';
class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/service.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.all(90),
            ),

            const SizedBox(height: 8), 

            Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.open_in_browser),
                      title: Text('Web Development'),
                      subtitle: Text('Your idea into reality. Have your own website.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                       
                        TextButton(
                          child: const Text('Contact Me'),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const Contact()));
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.mobile_friendly),
                      title: Text('Native Mobile Development'),
                      subtitle: Text('Your idea into reality. Have your own mobile app.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                       
                        TextButton(
                          child: const Text('Contact Me'),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const Contact()));
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.wb_cloudy),
                      title: Text('Hosting, DevOps'),
                      subtitle: Text('Migrate to AWS Clouds.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                       
                        TextButton(
                          child: const Text('Contact Me'),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const Contact()));
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8), 

            Center(
                child: Text(
                  'Clients',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
            ),

            const SizedBox(height: 8), 

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Color.fromARGB(22, 61, 122, 1),
                  radius: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(3), // Border radius
                    child: ClipOval(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/img/services/movinghub.png'),
                        backgroundColor: Colors.transparent,
                        radius: 100,
                      ),
                    ),
                  ),
                ),

                CircleAvatar(
                  backgroundColor: Color.fromARGB(22, 61, 122, 1),
                  radius: 45,
                  child: Padding(
                    padding: EdgeInsets.all(3), // Border radius
                    child: ClipOval(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/img/services/strikingmedia.png'),
                        backgroundColor: Colors.transparent,
                        radius: 100,
                      ),
                    ),
                  ),
                ),

                CircleAvatar(
                  backgroundColor: Color.fromARGB(22, 61, 122, 1),
                  radius: 45,
                  child: Padding(
                    padding: EdgeInsets.all(3), // Border radius
                    child: ClipOval(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/img/services/alexachamp-logo.png'),
                        backgroundColor: Colors.transparent,
                        radius: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Color.fromARGB(22, 61, 122, 1),
                  radius: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(3), // Border radius
                    child: ClipOval(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/img/services/hackathon-ph-logo.png'),
                        backgroundColor: Colors.transparent,
                        radius: 100,
                      ),
                    ),
                  ),
                ),

                CircleAvatar(
                  backgroundColor: Color.fromARGB(22, 61, 122, 1),
                  radius: 45,
                  child: Padding(
                    padding: EdgeInsets.all(3), // Border radius
                    child: ClipOval(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/img/services/JCI-Baras.png'),
                        backgroundColor: Colors.transparent,
                        radius: 100,
                      ),
                    ),
                  ),
                ),

                CircleAvatar(
                  backgroundColor: Color.fromARGB(22, 61, 122, 1),
                  radius: 45,
                  child: Padding(
                    padding: EdgeInsets.all(3), // Border radius
                    child: ClipOval(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/img/services/uk-phone.png'),
                        backgroundColor: Colors.transparent,
                        radius: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ]
        ),
      ),
    );
  }
}
