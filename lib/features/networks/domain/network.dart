import 'package:freezed_annotation/freezed_annotation.dart';

part 'network.freezed.dart';
part 'network.g.dart';

@freezed
class Network with _$Network {
  const factory Network({
    required String name,
    required int id,
    required String logoPath,
    required String originCountry,
  }) = _Network;

  factory Network.fromJson(Map<String, Object?> json) =>
      _$NetworkFromJson(json);
}
