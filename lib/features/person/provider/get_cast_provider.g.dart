// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cast_provider.dart';

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

String _$getCastHash() => r'9ed3ff9eb9d8160d3c4ea43dbdccd3aead1cbfa8';

/// See also [getCast].
class GetCastProvider extends AutoDisposeFutureProvider<List<Person>> {
  GetCastProvider(
    this.mediaId,
    this.mediaType,
  ) : super(
          (ref) => getCast(
            ref,
            mediaId,
            mediaType,
          ),
          from: getCastProvider,
          name: r'getCastProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCastHash,
        );

  final int mediaId;
  final String mediaType;

  @override
  bool operator ==(Object other) {
    return other is GetCastProvider &&
        other.mediaId == mediaId &&
        other.mediaType == mediaType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);
    hash = _SystemHash.combine(hash, mediaType.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetCastRef = AutoDisposeFutureProviderRef<List<Person>>;

/// See also [getCast].
final getCastProvider = GetCastFamily();

class GetCastFamily extends Family<AsyncValue<List<Person>>> {
  GetCastFamily();

  GetCastProvider call(
    int mediaId,
    String mediaType,
  ) {
    return GetCastProvider(
      mediaId,
      mediaType,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Person>> getProviderOverride(
    covariant GetCastProvider provider,
  ) {
    return call(
      provider.mediaId,
      provider.mediaType,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getCastProvider';
}
