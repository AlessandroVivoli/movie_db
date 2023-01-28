import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/providers/account_service_provider.dart';
import '../../../core/providers/image_provider.dart';
import '../../../core/providers/user_provider.dart';
import '../../../utils/enums.dart';
import '../../shared/widgets/backdrop_image/backdrop_image.dart';
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
    final user = ref.watch(userProvider);

    return Text(
      user!.accountDetails.username,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _AccountDetailsImage extends ConsumerWidget {
  const _AccountDetailsImage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final accountAvatarService = ref.read(accountAvatarServiceProvider);
    final imageService = ref.read(imageServiceProvider);

    return BackdropImage(
      imgUrl: (user!.accountDetails.avatar.tmdb.avatarPath != null)
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
    );
  }
}
