import 'package:flutter/material.dart';

import 'package:gigamike/models/portfolio.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart';

/// List item representing a single Beer with its image and name.
class ListItem extends StatelessWidget {
  const ListItem({
    required this.portfolio,
    Key? key,
  }) : super(key: key);

  final Portfolio portfolio;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(7.0),
    child: buildCard(
      context,
      portfolio.name, 
      portfolio.description,
      portfolio.url, 
      portfolio.image_filename, 
    )
  );

  Card buildCard(context, name, description, url, image_filename) {
    var cardImage = CachedNetworkImageProvider('https://laravel7.gigamike.net/storage/portfolio/${image_filename}');

    if (url?.isEmpty) {
      url = 'https://laravel7.gigamike.net/portfolio';
    }

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
              height: 300.0,
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
          Container(
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.centerLeft,
            child: Text(
              _parseHtmlString(description),
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          ButtonBar(
            children: [
              TextButton(
                child: const Text(
                  'Demo',
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

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);

    var parsedString = htmlString;

    if(document.documentElement != null){
        parsedString = document.documentElement!.text;
    }

    return parsedString;
  }
}