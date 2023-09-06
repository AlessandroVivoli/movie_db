import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../features/auth/provider/auth_provider.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/widgets/error_text/error_text.dart';
import 'widgets/account_details_name_text.dart';
import 'widgets/rated_movies_section.dart';

class AccountDetailsWrapper extends HookConsumerWidget {
  const AccountDetailsWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    return user.maybeWhen(
      loggedIn: (user) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (user.accountDetails.name != null)
              AccountDetailsNameText(name: user.accountDetails.name!),
            RatedMoviesSection(
              user: user,
            ),
          ],
        ),
      ),
      orElse: () => Center(
        child: ErrorText(context.locale.notLoggedInErrorMessage),
      ),
    );
  }
}
