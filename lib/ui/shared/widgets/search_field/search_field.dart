import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'widgets/search_text_field.dart';

class SearchField extends HookWidget {
  const SearchField({
    super.key,
    required this.searchBuilder,
    this.onSubmit,
  });

  final List<Widget> Function(
    BuildContext context,
    String searchTerm,
  ) searchBuilder;

  final void Function(String searchTerm)? onSubmit;

  @override
  Widget build(BuildContext context) {
    final list = useValueNotifier<List<Widget>>([]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SearchTextField(
          searchBuilder: searchBuilder,
          list: list,
          onSubmit: onSubmit,
        ),
        if (list.value.isNotEmpty) _ResultList(listNotifier: list),
      ],
    );
  }
}

class _ResultList extends HookWidget {
  const _ResultList({required this.listNotifier});

  final ValueNotifier<List<Widget>> listNotifier;

  @override
  Widget build(BuildContext context) {
    final list = useValueListenable(listNotifier);

    return OverflowBox(
      maxHeight: 200,
      maxWidth: 100,
      child: ListView(
        children: list,
      ),
    );
  }
}
