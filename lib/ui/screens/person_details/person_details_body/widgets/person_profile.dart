import 'package:flutter/material.dart';

import '../../../../../core/services/image_service.dart';
import '../../../../../utils/enums.dart';

class PersonProfile extends StatelessWidget {
  const PersonProfile({
    Key? key,
    required this.profilePath,
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
            color: (profilePath != null)
                ? null
                : Theme.of(context).colorScheme.primary,
            image: (profilePath == null)
                ? null
                : DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      ImageService.getImageUrl(
                        size: ProfileSizes.w185.name,
                        path: profilePath!,
                      ),
                    ),
                  ),
          ),
          child: (profilePath != null)
              ? null
              : Center(
                  child: Icon(
                  Icons.person,
                  size: (width! - 50),
                )),
        ),
      ),
    );
  }
}
