import 'package:flutter/material.dart';

import '../../../../core/models/person/person.dart';

class PersonCard extends StatelessWidget {
  final Person person;

  const PersonCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    final path = (person.profilePath != null)
        ? 'https://image.tmdb.org/t/p/w500/${person.profilePath!}'
        : 'https://images.unsplash.com/photo-1511367461989-f85a21fda167';

    return GestureDetector(
      onTap: () {
        debugPrint('${person.id}');
      },
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                path,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Center(
                    child: Text(
                      person.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (person.knownForDepartment != null)
                  Center(
                    child: Text(
                      'Trending for ${person.knownForDepartment!}',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
