// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tv_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$getTVDetailsHash() => r'7b12bfe9ed6372a6a6b3e95e4b656329c19c9b08';

/// See also [getTVDetails].
class GetTVDetailsProvider extends AutoDisposeFutureProvider<TVShowDetails> {
  GetTVDetailsProvider(
    this.id,
  ) : super(
          (ref) => getTVDetails(
            ref,
            id,
          ),
          from: getTVDetailsProvider,
          name: r'getTVDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTVDetailsHash,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is GetTVDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetTVDetailsRef = AutoDisposeFutureProviderRef<TVShowDetails>;

/// See also [getTVDetails].
final getTVDetailsProvider = GetTVDetailsFamily();

class GetTVDetailsFamily extends Family<AsyncValue<TVShowDetails>> {
  GetTVDetailsFamily();

  GetTVDetailsProvider call(
    int id,
  ) {
    return GetTVDetailsProvider(
      id,
    );
  }

  @override
  AutoDisposeFutureProvider<TVShowDetails> getProviderOverride(
    covariant GetTVDetailsProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getTVDetailsProvider';
}
