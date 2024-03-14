import 'package:flutter/material.dart';

import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';
class About extends StatelessWidget {
  const About({super.key});

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const SizedBox(width: 10),
                Container(
                    width: 80,
                    height: 80,
                    child: const Stack(
                      alignment: Alignment(0.6, 0.6),
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/img/mik.jpg'),
                          radius: 100,
                        ),
                      ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                      'Hello and welcome to my mobile app!',
                      style: Theme.of(context).textTheme.headlineSmall,
                  ),  
                ),
                const SizedBox(width: 10),
              ],
            ),
            
            const SizedBox(height: 20),
            
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Mik “Gigamike” Galon is a Full-Stack Web/Mobile developer. He is a Zend Certified Engineer, Zend Framework 1 and 2 Certified Engineer, Laravel Certified, 13x AWS certified, and blockchain certified. He is a 14x hackathon winner in the Philippines. He considers himself a software craftsman rather than a simple programmer because he obsesses over every detail of the applications that he develops. He is passionate about technology, innovation, and big challenging tasks.',
                softWrap: true,
              ),
            ),
            
            const SizedBox(height: 20),
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlutterSocialButton(
                      onTap: (){
                        _launchUrl(Uri.parse('https://www.linkedin.com/in/gigamike/'));
                      },
                      mini: true,
                      buttonType: ButtonType.linkedin,
                    ),
                    FlutterSocialButton(
                      onTap: () {
                        _launchUrl(Uri.parse('https://www.facebook.com/gigamikenet/'));
                      },
                      mini: true,
                      buttonType: ButtonType.facebook,
                    ),
                    FlutterSocialButton(
                      onTap: () {
                        _launchUrl(Uri.parse('https://github.com/gigamike'));
                      },
                      mini: true,
                      buttonType: ButtonType.github,
                    ),
                    FlutterSocialButton(
                      onTap: () {
                        _launchUrl(Uri.parse('https://twitter.com/gigamike'));
                      },
                      mini: true,
                      buttonType: ButtonType.twitter,
                    ),
                  ],
                )
              ],
            ),
            
            const SizedBox(height: 30),
            
            /*
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                    ),
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.phone,
                    ),
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.whatsapp,
                    ),
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.google,
                    ),
                  ],
                )
              ],
            ),
            
            const SizedBox(height: 30),
            */

            const Center(
              child: Text(
                'www.gigamike.net',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
