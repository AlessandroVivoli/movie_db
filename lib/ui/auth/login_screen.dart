import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/password_text_field.dart';
import 'widgets/submit_button.dart';
import 'widgets/username_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();

    return SafeArea(
      top: false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          child: const Icon(Icons.keyboard_double_arrow_left),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        body: Center(
          child: SizedBox(
            width: 250,
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: _FormWidgets(
                formKey: formKey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormWidgets extends HookWidget {
  const _FormWidgets({
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController(text: null);
    final passwordController = useTextEditingController(text: null);
    final passwordNode = useFocusNode();

    final localization = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            localization.loginScreenTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        UsernameTextField(
          usernameController: usernameController,
          nextNode: passwordNode,
        ),
        const SizedBox(height: 10),
        PasswordTextField(
          passwordController: passwordController,
          passwordNode: passwordNode,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${localization.poweredByLabel} ',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              InkWell(
                onTap: () async {
                  if (await canLaunchUrl(Uri.https('www.themoviedb.org'))) {
                    launchUrl(Uri.https('www.themoviedb.org'),
                        mode: LaunchMode.externalApplication);
                  }
                },
                child: SvgPicture.asset(
                  'assets/tmdb-logo.svg',
                  height: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: SubmitButton(
            formKey: formKey,
            usernameController: usernameController,
            passwordController: passwordController,
          ),
        ),
      ],
    );
  }
}
