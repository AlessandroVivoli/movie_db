import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../features/person/domain/person_details.dart';
import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/widgets/carousel/image_carousel/image_carousel.dart';
import '../../../../core/widgets/errors/error_text.dart';
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

    final localization = AppLocalizations.of(context)!;

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
        context.showErrorSnackBar(localization.getPersonImagesError);

        return Center(
          child: ErrorText(localization.unexpectedErrorMessage),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
