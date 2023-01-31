import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_state.freezed.dart';

@freezed
class RateState with _$RateState {
  const factory RateState.init() = RateInit;
  const factory RateState.completed() = RateCompleted;
  const factory RateState.loading() = RateLoading;
  const factory RateState.error(
    Object? error,
    StackTrace stackTrace,
  ) = RateError;
}
