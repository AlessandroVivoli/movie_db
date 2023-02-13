import 'package:flutter/material.dart';

import 'widgets/result_list/result_list.dart';
import 'widgets/suggestion_list/suggestion_list.dart';

class MovieSearchDelegate extends SearchDelegate<int?> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ResultList(query: query.trim());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SuggestionList(query: query.trim());
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
          appBarTheme: AppBarTheme(
            color: Theme.of(context).colorScheme.background,
          ),
        );
  }
}
