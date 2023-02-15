import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/account/provider/favorites/get_favorite_movies_provider.dart';
import '../../../features/account/provider/get_rated_movies_provider.dart';
import '../../../features/account/provider/watchlist/get_movie_watchlist_provider.dart';
import '../../../features/auth/provider/auth_provider.dart';
import '../../../features/local_storage/provider/local_storage_provider.dart';
import '../../../features/localization/provider/locale_state_provider.dart';
import '../../../routing/routes.dart';
import 'widgets/logged_in_drawer_view/logged_in_drawer_view.dart';
import 'widgets/logged_out_drawer_view/logged_out_drawer_view.dart';

class AccountDrawer extends HookConsumerWidget {
  const AccountDrawer({
    super.key,
    this.onLogin,
  });
  final void Function()? onLogin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    final widget = useValueNotifier<Widget>(const LoggedOutDrawerView());

    user.whenOrNull<void>(
      loggedIn: (user) {
        widget.value = LoggedInDrawerView(
          accountDetails: user.accountDetails,
          onPressed: () {
            ref.read(authProvider.notifier).logout();
          },
          onProfilePressed: () {
            Scaffold.of(context).closeDrawer();

            Navigator.of(context).pushNamed(
              AppRoute.account,
              arguments: user.accountDetails,
            );
          },
        );
      },
      loggedOut: () {
        widget.value = LoggedOutDrawerView(
          onLogin: (onLogin != null) ? onLogin : null,
        );
      },
    );

    return SafeArea(
      child: _LocaleColumn(
        notifierWidget: widget,
      ),
    );
  }
}

class _LocaleColumn extends HookConsumerWidget {
  const _LocaleColumn({
    required this.notifierWidget,
  });

  final ValueNotifier<Widget> notifierWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widget = useValueListenable(notifierWidget);

    final locale = ref.watch(localeStateProvider);
    const supportedLocales = AppLocalizations.supportedLocales;
    final localization = AppLocalizations.of(context)!;

    return Column(
      children: [
        Expanded(child: widget),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('${AppLocalizations.of(context)!.localizationLabel}:'),
              DropdownButton(
                value: locale,
                items: List.generate(
                  supportedLocales.length,
                  (index) => DropdownMenuItem(
                    value: supportedLocales[index],
                    child: Text(
                      localization.languageSelection(
                        supportedLocales[index].languageCode,
                      ),
                    ),
                  ),
                ),
                onChanged: (Locale? value) {
                  if (value == null) return;

                  ref.read(localeStateProvider.notifier).state = value;

                  ref.read(localStorageProvider).setLocale(value);
                  ref.invalidate(getFavoriteMoviesProvider);
                  ref.invalidate(getMovieWatchlistProvider);
                  ref.invalidate(getRatedMoviesProvider);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
