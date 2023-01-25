import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

import '../../../../../core/models/person/details/person_details.dart';
import '../../../../../core/providers/image_provider.dart';
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

class _PersonCarouselBuilder extends ConsumerWidget {
  const _PersonCarouselBuilder({
    Key? key,
    required this.personDetails,
  }) : super(key: key);

  final PersonDetails personDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personImages = ref.watch(getPersonImagesProvider(personDetails.id));

    return personImages.when(
      data: (images) {
        if (images.isEmpty) {
          return const Center(
            child: Icon(
              Icons.person,
              size: 100,
            ),
          );
        }

        return ImageCarousel(
          images: images.take(10).toList(),
        );
      },
      error: (error, stackTrace) {
        logError('Could not get person images.', error, stackTrace);

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

        return const Center(
          child: ErrorText('Something went wrong.'),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
