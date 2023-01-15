import 'package:flutter/material.dart';

import '../../../../core/models/person/person.dart';
import '../../../../core/services/image_service.dart';
import '../../../../core/services/person_service.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/routes.dart';
import '../custom_image/custom_network_image.dart';

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
          AppRoute.person,
          arguments: PersonService.getPersonDetails(id: person.id),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: imgRadius,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(imgRadius),
              child: CustomNetworkImage(
                width: imgRadius * 2,
                height: imgRadius * 2,
                url: ImageService.getImageUrl(
                  size: ProfileSizes.w185.name,
                  path: person.profilePath,
                ),
                placeholderIcon: const Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
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
