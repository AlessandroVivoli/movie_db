import 'package:flutter/material.dart';

import '../../custom_image/custom_network_image.dart';

class PersonCardWrapper extends StatelessWidget {
  const PersonCardWrapper({
    super.key,
    required this.imgRadius,
    required this.imageUrl,
    this.department,
    required this.name,
  });

  final double imgRadius;
  final String? imageUrl;
  final String? department;
  final String name;

  @override
  Widget build(BuildContext context) {
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
              url: imageUrl,
              placeholder: const Icon(
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
                    name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if (department != null)
                Center(
                  child: Text(
                    'Trending for $department',
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
