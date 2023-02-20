import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/extensions/build_context_extensions.dart';
import '../../core/widgets/errors/error_text.dart';
import '../../core/widgets/person_list/person_list.dart';
import '../../features/person/provider/get_cast_provider.dart';

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

    return cast.when(
      data: (castList) {
        if (castList.isEmpty) {
          return Center(
            child: Text(context.locale.noCast),
          );
        }

        return PersonList(
          personList: castList,
          padding: 10,
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
