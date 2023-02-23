import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/extensions/build_context_extensions.dart';
import '../../core/widgets/error_text/error_text.dart';
import '../../core/widgets/person_list/person_list.dart';
import '../../features/person/domain/profile_sizes_enum.dart';
import '../../features/person/provider/get_cast_provider.dart';
import '../../features/person/provider/image/person_image_service_provider.dart';

class MediaCasts extends StatelessWidget {
  const MediaCasts({
    super.key,
    required this.mediaId,
    required this.mediaType,
  });

  final int mediaId;
  final String mediaType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 10),
          child: Text(
            context.locale.movieCastsLabel.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: _CastList(
            mediaId: mediaId,
            mediaType: mediaType,
          ),
        ),
      ],
    );
  }
}

class _CastList extends ConsumerWidget {
  const _CastList({
    required this.mediaId,
    required this.mediaType,
  });

  final int mediaId;
  final String mediaType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cast = ref.watch(getCastProvider(mediaId, mediaType));

    final imageService = ref.watch(personImageServiceProvider);

    return cast.when(
      data: (castList) {
        if (castList.isEmpty) {
          return Center(
            child: Text(context.locale.noCast),
          );
        }

        return PersonList(
          length: castList.length,
          padding: 10,
          nameBuilder: (int index) => castList[index].name,
          imageBuilder: (int index) => imageService.getPersonProfileUrl(
            size: ProfileSizes.w185,
            path: castList[index].profilePath,
          ),
          departmentBuilder: (int index) => castList[index].knownForDepartment,
        );
      },
      error: (error, stackTrace) {
        context.showErrorSnackBar(context.locale.getCastError);

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
