import 'package:flutter/material.dart';

import 'package:gigamike/models/certification.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:url_launcher/url_launcher.dart';

/// List item representing a single Beer with its image and name.
class ListItem extends StatelessWidget {
  const ListItem({
    required this.certification,
    Key? key,
  }) : super(key: key);

  final Certification certification;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(7.0),
    child: buildCard(
      context,
      certification.name, 
      certification.url, 
      certification.image_filename, 
    )
  );

  Card buildCard(context, name, url, image_filename) {
    var cardImage = CachedNetworkImageProvider('https://laravel7.gigamike.net/storage/certification/${image_filename}');

    return Card(
      elevation: 4.0,
      color: const Color.fromRGBO(22, 61, 122, 1),
      child: Column(
        children: [
          ListTile(
            onTap: () {
                _launchUrl(Uri.parse(url));
            },
            title: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(3.0),
              height: 400.0,
              child: InkWell(
                child: Ink.image(
                  image: cardImage,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  _launchUrl(Uri.parse(url));
                },
              ),
          ),
          // Container(
          //   padding: const EdgeInsets.all(5.0),
          //   alignment: Alignment.centerLeft,
          //   child: Text(_parseHtmlString(excerpt)),
          // ),
          ButtonBar(
            children: [
              TextButton(
                child: const Text(
                  'View more',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  _launchUrl(Uri.parse(url));
                },
              )
            ],
          )
        ],
      )
    );
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}