import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/models/person/details/person_details.dart';
import '../../../../../core/services/image_service.dart';
import '../../../../shared/widgets/carousel/image_carousel/image_carousel.dart';
import '../../../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../../../shared/widgets/errors/error_text.dart';

class PersonDetailsCarousel extends StatelessWidget {
  const PersonDetailsCarousel({
    Key? key,
    required this.personDetails,
  }) : super(key: key);

  final PersonDetails personDetails;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: _PersonCarouselBuilder(personDetails: personDetails),
        title: Text(personDetails.name),
        centerTitle: true,
      ),
    );
  }
}

class _PersonCarouselBuilder extends StatelessWidget {
  const _PersonCarouselBuilder({
    Key? key,
    required this.personDetails,
  }) : super(key: key);

  final PersonDetails personDetails;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ImageService.getPersonImages(id: personDetails.id),
      builder: (context, snapshot) {
        late Widget widget;

        if (snapshot.connectionState == ConnectionState.waiting) {
          widget = const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  content: const ErrorSnackBarContent(
                    message: 'Could not get person images.',
                  ),
                ),
              );
            });

            widget = const Center(
              child: ErrorText('Something went wrong.'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            widget = const Center(
              child: Icon(
                Icons.person,
                size: 100,
              ),
            );
          } else {
            widget = ImageCarousel(
              images: snapshot.data!.take(10).toList(),
            );
          }
        }

        return widget;
      },
    );
  }
}
