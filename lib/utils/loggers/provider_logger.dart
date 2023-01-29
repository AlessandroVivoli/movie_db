import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  final logName = 'STATE';

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    final args = provider.argument != null ? '(${provider.argument})' : '';

    log('DISPOSED: ${provider.name ?? provider.runtimeType}$args',
        name: logName);

    super.didDisposeProvider(provider, container);
  }

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    final args = provider.argument != null ? '(${provider.argument})' : '';

    log('INITIALIZED: ${provider.name ?? provider.runtimeType}$args',
        name: logName);

    super.didAddProvider(provider, value, container);
  }

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    final args = provider.argument != null ? '(${provider.argument})' : '';

    log('ERROR: ${provider.name ?? provider.runtimeType}$args\nDETAILS: $error',
        name: logName);

    super.providerDidFail(provider, error, stackTrace, container);
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final args = provider.argument != null ? '(${provider.argument})' : '';

    log('UPDATE: ${provider.name ?? provider.runtimeType}$args\nNEW STATE: $newValue',
        name: logName);

    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}
