import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/providers/account_service_provider.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/providers/image_provider.dart';
import '../../../utils/enums.dart';
import '../../shared/widgets/backdrop_image/backdrop_image.dart';
import '../../shared/widgets/errors/error_text.dart';
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

    return user.maybeWhen(
      loggedIn: (user) => Text(
        user.accountDetails.username,
        overflow: TextOverflow.ellipsis,
      ),
      loading: () => const CircularProgressIndicator(),
      orElse: () => const ErrorText('Not logged in.'),
    );
  }
}

class _AccountDetailsImage extends ConsumerWidget {
  const _AccountDetailsImage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    final accountAvatarService = ref.watch(accountAvatarServiceProvider);
    final imageService = ref.watch(imageServiceProvider);

    return user.maybeWhen(
      loggedIn: (user) => BackdropImage(
        imgUrl: (user.accountDetails.avatar.tmdb.avatarPath != null)
            ? imageService.getImageUrl(
                size: ProfileSizes.original.name,
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
      orElse: () => const Center(child: ErrorText('You\'re not logged in!')),
    );
  }
}
