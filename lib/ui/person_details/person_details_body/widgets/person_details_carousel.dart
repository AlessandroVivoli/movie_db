import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/shared/widgets/carousel/image_carousel/image_carousel.dart';
import '../../../../../core/shared/widgets/errors/error_text.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../features/person/domain/person_details.dart';
import '../../../../features/image/provider/get_person_images_provider.dart';

class PersonDetailsCarousel extends StatelessWidget {
  const PersonDetailsCarousel({
    super.key,
    required this.personDetails,
  });

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
    required this.personDetails,
  });

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
        context.showErrorSnackBar('Could not get person images.');

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
