import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

StreamSubscription useKeyboardVisible(
  void Function(bool visible) onData,
) {
  return use(_KeyboardStreamHook(onData));
}

typedef _KeyboardStreamState
    = HookState<StreamSubscription<bool>, _KeyboardStreamHook>;

class _KeyboardStreamHook extends Hook<StreamSubscription<bool>> {
  const _KeyboardStreamHook(this.onData);

  final void Function(bool visible)? onData;

  @override
  _KeyboardStreamState createState() => __KeyboardStreamHookState();
}

class __KeyboardStreamHookState extends _KeyboardStreamState {
  final controller = KeyboardVisibilityController();
  late final streamSubscription = controller.onChange.listen(hook.onData);

  @override
  StreamSubscription<bool> build(BuildContext context) => streamSubscription;

  @override
  void dispose() => streamSubscription.cancel();

  @override
  String? get debugLabel => 'useKeyboardChangeListener';
}
