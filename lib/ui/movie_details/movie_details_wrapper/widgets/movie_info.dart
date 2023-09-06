import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_extensions.dart';

class MovieInfo extends StatelessWidget {
  final int budget;
  final int? runtime;
  final DateTime? releaseDate;

  const MovieInfo({
    super.key,
    required this.budget,
    required this.runtime,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _BudgetText(budget: budget),
          _DurationText(runtime: runtime),
          _ReleaseDateText(releaseDate: releaseDate),
        ],
      ),
    );
  }
}

class _BudgetText extends StatelessWidget {
  const _BudgetText({
    required this.budget,
  });

  final int budget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.movieBudgetLabel.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '\$$budget ',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _DurationText extends StatelessWidget {
  const _DurationText({
    required this.runtime,
  });

  final int? runtime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.movieDurationLabel.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          (runtime != null) ? '$runtime min' : '?',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _ReleaseDateText extends StatelessWidget {
  const _ReleaseDateText({
    required this.releaseDate,
  });

  final DateTime? releaseDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.releaseDateLabel.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          (releaseDate != null)
              ? context.locale.releaseDateValue(releaseDate!)
              : '?',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
