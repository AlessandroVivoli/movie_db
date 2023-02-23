import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Paginator extends HookWidget {
  const Paginator({super.key, required this.page, required this.maxPage});

  final ValueNotifier<int> page;
  final ValueNotifier<int> maxPage;

  @override
  Widget build(BuildContext context) {
    final currentPage = useValueListenable(page);
    final currentMaxPage = useValueListenable(maxPage);

    final validTop = (currentPage < currentMaxPage);
    final validBottom = (currentPage > 1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: (validBottom) ? () => page.value-- : null,
          icon: const Icon(Icons.chevron_left),
        ),
        Text('$currentPage'),
        IconButton(
          onPressed: (validTop) ? () => page.value++ : null,
          icon: const Icon(Icons.chevron_right),
        )
      ],
    );
  }
}
