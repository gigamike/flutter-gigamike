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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: certifications.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                  _launchUrl(Uri.parse( certifications[index].url));
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/certifications/' + certifications[index].photo),
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
    );
  }
}
