// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_similar_tv_shows_provider.dart';

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

String _$getSimilarTVShowsHash() => r'e08cbbda7c6a221daa824cd928425a16b3fdb4e6';

/// See also [getSimilarTVShows].
class GetSimilarTVShowsProvider
    extends AutoDisposeFutureProvider<List<TVShow>> {
  GetSimilarTVShowsProvider(
    this.tvId,
  ) : super(
          (ref) => getSimilarTVShows(
            ref,
            tvId,
          ),
          from: getSimilarTVShowsProvider,
          name: r'getSimilarTVShowsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSimilarTVShowsHash,
        );

  final int tvId;

  @override
  bool operator ==(Object other) {
    return other is GetSimilarTVShowsProvider && other.tvId == tvId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tvId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetSimilarTVShowsRef = AutoDisposeFutureProviderRef<List<TVShow>>;

/// See also [getSimilarTVShows].
final getSimilarTVShowsProvider = GetSimilarTVShowsFamily();

class GetSimilarTVShowsFamily extends Family<AsyncValue<List<TVShow>>> {
  GetSimilarTVShowsFamily();

  GetSimilarTVShowsProvider call(
    int tvId,
  ) {
    return GetSimilarTVShowsProvider(
      tvId,
    );
  }

  @override
  AutoDisposeFutureProvider<List<TVShow>> getProviderOverride(
    covariant GetSimilarTVShowsProvider provider,
  ) {
    return call(
      provider.tvId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getSimilarTVShowsProvider';
}
