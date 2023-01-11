import 'package:flutter/material.dart';

import '../../../../core/models/person/person.dart';
import '../../../../core/services/image_service.dart';
import '../../../../core/services/person_service.dart';
import '../../../../utils/enums.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNames.personDetails.name,
          arguments: PersonService.getPersonDetails(id: person.id),
        );
      },
      child: Column(
        children: [
          if (person.profilePath != null)
            Center(
              child: CircleAvatar(
                radius: imgRadius,
                backgroundImage: NetworkImage(
                  ImageService.getImageUrl(
                    size: ProfileSizes.w185.name,
                    path: person.profilePath!,
                  ),
                ),
              ),
            ),
          if (person.profilePath == null)
            BlankProfileImage(imgRadius: imgRadius),
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
