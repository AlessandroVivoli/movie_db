import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_state_provider.g.dart';

@Riverpod(keepAlive: true)
class LocaleState extends _$LocaleState {
  @override
  Locale build() => const Locale('en');
}
