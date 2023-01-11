import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonName extends StatelessWidget {
  const PersonName({
    Key? key,
    required this.name,
    this.imdbId,
  }) : super(key: key);

  final String name;
  final String? imdbId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
        if (imdbId != null)
          TextButton.icon(
            onPressed: () async {
              final url = Uri.https('www.imdb.com', '/name/$imdbId');

              if (await canLaunchUrl(url)) {
                launchUrl(url);
              }
            },
            icon: const FaIcon(FontAwesomeIcons.imdb),
            label: const Text('Open in imdb'),
          ),
      ],
    );
  }
}
