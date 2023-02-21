import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/person/domain/person_details.dart';
import '../../../../core/extensions/build_context_extensions.dart';
import '../../../carousel/image_carousel/image_carousel.dart';
import '../../../../core/widgets/error_text/error_text.dart';
import '../../../../features/person/provider/image/get_person_images_provider.dart';

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
        context.showErrorSnackBar(context.locale.getPersonImagesError);

        return Center(
          child: ErrorText(context.locale.unexpectedErrorMessage),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
