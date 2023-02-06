import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/account/provider/account_avatar_service_provider.dart';
import '../../../features/auth/provider/auth_provider.dart';
import '../../core/widgets/backdrop_image/backdrop_image.dart';
import '../../core/widgets/errors/error_text.dart';
import '../../features/person/domain/profile_sizes_enum.dart';
import '../../features/person/provider/image/person_image_service_provider.dart';
import 'account_details_wrapper/account_details_wrapper.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: _UsernameText(),
                centerTitle: true,
                background: _AccountDetailsImage(),
              ),
            ),
            SliverToBoxAdapter(
              child: AccountDetailsWrapper(),
            )
          ],
        ),
      ),
    );
  }
}

class _UsernameText extends ConsumerWidget {
  const _UsernameText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    final localization = AppLocalizations.of(context)!;

    return user.maybeWhen(
      loggedIn: (user) => Text(
        user.accountDetails.username,
        overflow: TextOverflow.ellipsis,
      ),
      loading: () => const CircularProgressIndicator(),
      orElse: () => ErrorText(localization.notLoggedInErrorMessage),
    );
  }
}

class _AccountDetailsImage extends ConsumerWidget {
  const _AccountDetailsImage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    final accountAvatarService = ref.watch(accountAvatarServiceProvider);
    final imageService = ref.watch(personImageServiceProvider);

    final localization = AppLocalizations.of(context)!;

    return user.maybeWhen(
      loggedIn: (user) => BackdropImage(
        imgUrl: (user.accountDetails.avatar.tmdb.avatarPath != null)
            ? imageService.getPersonProfileUrl(
                size: ProfileSizes.original,
                path: user.accountDetails.profilePath,
              )
            : accountAvatarService.getAccountAvatar(
                hash: user.accountDetails.profilePath,
                size: 2000,
              ),
        placeholderIcon: const Icon(
          Icons.person,
          size: 100,
        ),
      ),
      orElse: () => Center(
        child: ErrorText(localization.notLoggedInErrorMessage),
      ),
    );
  }
}
