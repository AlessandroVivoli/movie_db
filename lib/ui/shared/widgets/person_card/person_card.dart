import 'package:flutter/material.dart';

import '../../../../core/models/person/person.dart';
import '../blank_profile_image/blank_profile_image.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  final double imgRadius;
  final double imgBorderWidth;

  const PersonCard({
    super.key,
    required this.person,
    this.imgRadius = 40,
    this.imgBorderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    final imgPath = 'https://image.tmdb.org/t/p/w500/${person.profilePath}';

    return GestureDetector(
      onTap: () {
        debugPrint('${person.id}');
      },
      child: Column(
        children: [
          if (person.profilePath != null)
            Center(
              child: CircleAvatar(
                radius: imgRadius,
                backgroundImage: NetworkImage(
                  imgPath,
                ),
              ),
            ),
          if (person.profilePath == null)
            BlankProfileImage(
              imgRadius: imgRadius,
              imgBorderWidth: imgBorderWidth,
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
