import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:gigamike/data/certifications.dart';
class Certifications extends StatelessWidget {
  const Certifications({super.key});

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certifications'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/certifications.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          
            const SizedBox(height: 8), 
        
            Expanded(
              child: ListView.builder(
                itemCount: certifications.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                        _launchUrl(Uri.parse( certifications[index].url));
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/img/certifications/' + certifications[index].photo),
                    ),
                    title: Text(
                      certifications[index].title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  );
                },
              ),
            ),
        
          ],
        ),
    );
  }
}
