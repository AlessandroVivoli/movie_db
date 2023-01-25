import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/providers/general_providers.dart';
import '../../../core/services/account_avatar_service.dart';
import '../../../core/services/image_service.dart';
import '../../../utils/enums.dart';
import '../../shared/widgets/backdrop_image/backdrop_image.dart';
import 'account_details_wrapper/account_details_wrapper.dart';

class AccountDetailsScreen extends ConsumerWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountDetails = ref.watch(accountDetailsStateProvider)!;

    return SafeArea(
      top: false,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  accountDetails.username,
                  overflow: TextOverflow.ellipsis,
                ),
                centerTitle: true,
                background: BackdropImage(
                  imgUrl: (accountDetails.avatar.tmdb.avatarPath != null)
                      ? ImageService.getImageUrl(
                          size: ProfileSizes.original.name,
                          path: accountDetails.profilePath,
                        )
                      : AccountAvatarService.getAccountAvatar(
                          hash: accountDetails.profilePath,
                          size: 2000,
                        ),
                  placeholderIcon: const Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: AccountDetailsWrapper(
                accountDetails: accountDetails,
              ),
            )
          ],
        ),
      ),
    );
  }
}
