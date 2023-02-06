import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_state.freezed.dart';

@freezed
class RateState with _$RateState {
  const factory RateState.idle() = RateIdle;
  const factory RateState.success() = RateSuccess;
  const factory RateState.loading() = RateLoading;
  const factory RateState.error(
    Object? error,
    StackTrace stackTrace,
  ) = RateError;
}
