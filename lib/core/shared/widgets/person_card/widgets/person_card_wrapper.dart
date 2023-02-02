import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/image/provider/image_service_provider.dart';
import '../../../../../features/person/domain/person.dart';
import '../../../../utils/enums.dart';
import '../../custom_image/custom_network_image.dart';

class PersonCardWrapper extends ConsumerWidget {
  const PersonCardWrapper({
    super.key,
    required this.imgRadius,
    required this.person,
  });

  final double imgRadius;
  final Person person;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageService = ref.watch(imageServiceProvider);

    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          radius: imgRadius,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(imgRadius),
            child: CustomNetworkImage(
              width: imgRadius * 2,
              height: imgRadius * 2,
              url: imageService.getImageUrl(
                size: ProfileSizes.w185.name,
                path: person.profilePath,
              ),
              placeholderIcon: const Icon(
                Icons.person,
                size: 40,
              ),
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
    );
  }
}
