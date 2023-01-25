import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/providers/account_provider.dart';
import '../../../core/providers/general_providers.dart';
import '../../../core/providers/image_provider.dart';
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
  const _UsernameText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountDetails = ref.watch(accountDetailsStateProvider)!;

    return Text(
      accountDetails.username,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _AccountDetailsImage extends ConsumerWidget {
  const _AccountDetailsImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountDetails = ref.watch(accountDetailsStateProvider)!;
    final accountAvatarService = ref.watch(accountAvatarServiceProvider);
    final imageService = ref.watch(imageServiceProvider);

    return BackdropImage(
      imgUrl: (accountDetails.avatar.tmdb.avatarPath != null)
          ? imageService.getImageUrl(
              size: ProfileSizes.original.name,
              path: accountDetails.profilePath,
            )
          : accountAvatarService.getAccountAvatar(
              hash: accountDetails.profilePath,
              size: 2000,
            ),
      placeholderIcon: const Icon(
        Icons.person,
        size: 100,
      ),
    );
  }
}
