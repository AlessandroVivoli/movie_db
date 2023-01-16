import 'package:flutter/material.dart';

import '../../../core/models/person/details/person_details.dart';
import '../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../shared/widgets/errors/error_text.dart';
import 'person_details_body/person_details_body.dart';

class PersonDetailsScreen extends StatelessWidget {
  final Future<PersonDetails> personDetails;

  const PersonDetailsScreen({super.key, required this.personDetails});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: _PersonDetailsBodyBuilder(personDetails: personDetails),
      ),
    );
  }
}

class _PersonDetailsBodyBuilder extends StatelessWidget {
  const _PersonDetailsBodyBuilder({
    Key? key,
    required this.personDetails,
  }) : super(key: key);

  final Future<PersonDetails> personDetails;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: personDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PersonDetailsBody(personDetails: snapshot.data!);
        } else if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                content: const ErrorSnackBarContent(
                  message: 'Could not get person details.',
                ),
              ),
            );
          });

          return Column(
            children: [
              AppBar(),
              const Center(
                child: ErrorText('Something went wrong.'),
              ),
            ],
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
