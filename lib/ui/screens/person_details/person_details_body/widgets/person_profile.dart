import 'package:flutter/material.dart';

import '../../../../../core/services/image_service.dart';
import '../../../../../utils/enums.dart';
import '../../../../shared/widgets/custom_image/custom_network_image.dart';

class PersonProfile extends StatelessWidget {
  const PersonProfile({
    Key? key,
    this.profilePath,
    this.width = 200,
    this.margin,
  }) : super(key: key);

  final String? profilePath;
  final double? width;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CustomNetworkImage(
              url: ImageService.getImageUrl(
                size: ProfileSizes.original.name,
                path: profilePath,
              ),
              placeholderIcon: const Icon(Icons.person),
            ),
          ),
        ),
      ),
    );
  }
}
