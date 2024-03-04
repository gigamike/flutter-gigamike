import 'package:flutter/material.dart';

import 'package:gigamike/models/post.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';

/// List item representing a single Beer with its image and name.
class ListItem extends StatelessWidget {
  const ListItem({
    required this.post,
    Key? key,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(7.0),
    child: buildCard(
      context,
      post.title, 
      post.date, 
      post.excerpt, 
      post.featuredmedia,
      post.link,
    )
  );

  Card buildCard(context, heading, date, excerpt, featuredmedia, link) {
    var cardImage = CachedNetworkImageProvider(featuredmedia);

    var inputDate = DateTime.parse(date);
    var outputFormat = DateFormat('MMMM dd, yyyy');
    var outputDate = outputFormat.format(inputDate);

    return Card(
      elevation: 4.0,
      
      child: Column(
        children: [
          ListTile(
            onTap: () {
                _launchUrl(Uri.parse(link));
            },
            title: Text(
              heading,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text(outputDate),
          ),
          Container(
              height: 200.0,
              child: InkWell(
                child: Ink.image(
                  image: cardImage,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  _launchUrl(Uri.parse(link));
                },
              ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.centerLeft,
            child: Text(_parseHtmlString(excerpt)),
          ),
          ButtonBar(
            children: [
              TextButton(
                child: const Text('View more'),
                onPressed: () {
                  _launchUrl(Uri.parse(link));
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