import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/extensions/build_context_extensions.dart';
import '../../core/widgets/errors/error_text.dart';
import '../../features/person/provider/get_cast_provider.dart';
import '../../features/tv_shows/domain/tv_show_details.dart';
import '../../features/tv_shows/provider/get_similar_tv_shows_provider.dart';
import '../../features/tv_shows/provider/get_tv_details_provider.dart';
import '../../routing/routes.dart';
import '../play_button/play_button.dart';
import 'backdrop/backdrop.dart';
import 'tv_details_wrapper/tv_details_wrapper.dart';

class TVDetailsScreen extends StatelessWidget {
  const TVDetailsScreen({super.key, required this.tvId});

  final int tvId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: _TVDetailsWrapper(tvId: tvId),
      ),
    );
  }
}

class _TVDetailsWrapper extends ConsumerWidget {
  const _TVDetailsWrapper({required this.tvId});

  final int tvId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tvDetails = ref.watch(getTVDetailsProvider(tvId));

    final localization = AppLocalizations.of(context)!;

    return tvDetails.when(
      data: (details) => RefreshIndicator(
        child: _TVDetailsBody(details: details),
        onRefresh: () => Future(() {
          ref.invalidate(getTVDetailsProvider(tvId));
          ref.invalidate(getCastProvider(tvId, 'tv'));
          ref.invalidate(getSimilarTVShowsProvider(tvId));
        }),
      ),
      error: (error, stackTrace) {
        context.showErrorSnackBar(localization.getTVDetailsError);

        return Column(
          children: [
            AppBar(),
            Expanded(
              child: Center(
                child: ErrorText(localization.unexpectedErrorMessage),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _TVDetailsBody extends HookWidget {
  const _TVDetailsBody({required this.details});

  final TVShowDetails details;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return Stack(
      children: [
        CustomScrollView(
          controller: scrollController,
          slivers: [
            TVDetailsBackdrop(details: details),
            SliverToBoxAdapter(
              child: TVDetailsWrapper(
                details: details,
              ),
            )
          ],
        ),
        PlayButton(
          controller: scrollController,
          onPressed: () => Navigator.pushNamed(
            context,
            AppRoute.play,
            arguments: [details.id, 'tv'],
          ),
        ),
      ],
    );
  }
}
