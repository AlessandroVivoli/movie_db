import 'package:flutter/material.dart';

import '../../../core/models/person/details/person_details.dart';
import 'person_details_body/person_details_body.dart';

class PersonDetailsScreen extends StatelessWidget {
  final Future<PersonDetails> personDetails;

  const PersonDetailsScreen({super.key, required this.personDetails});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: personDetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              WidgetsBinding.instance.addPersistentFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Could not get person details')),
                );
              });

              return Column(
                children: const [
                  Expanded(
                    child: Center(child: Text('Nothing found')),
                  )
                ],
              );
            }

            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Expanded(
                    child: Center(child: Text('Nothing found')),
                  )
                ],
              );
            }

            return PersonDetailsBody(personDetails: snapshot.data!);
          },
        ),
      ),
    );
  }
}
