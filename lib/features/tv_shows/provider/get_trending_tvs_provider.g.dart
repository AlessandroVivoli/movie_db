// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trending_tvs_provider.dart';

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

String _$getTrendingTVShowsHash() =>
    r'33bd1776a60cc8fe063ea1a4fe1c51f3ccc8c095';

/// See also [getTrendingTVShows].
class GetTrendingTVShowsProvider extends FutureProvider<List<TVShow>> {
  GetTrendingTVShowsProvider(
    this.timeWindow,
  ) : super(
          (ref) => getTrendingTVShows(
            ref,
            timeWindow,
          ),
          from: getTrendingTVShowsProvider,
          name: r'getTrendingTVShowsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTrendingTVShowsHash,
        );

  final String timeWindow;

  @override
  bool operator ==(Object other) {
    return other is GetTrendingTVShowsProvider &&
        other.timeWindow == timeWindow;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, timeWindow.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetTrendingTVShowsRef = FutureProviderRef<List<TVShow>>;

/// See also [getTrendingTVShows].
final getTrendingTVShowsProvider = GetTrendingTVShowsFamily();

class GetTrendingTVShowsFamily extends Family<AsyncValue<List<TVShow>>> {
  GetTrendingTVShowsFamily();

  GetTrendingTVShowsProvider call(
    String timeWindow,
  ) {
    return GetTrendingTVShowsProvider(
      timeWindow,
    );
  }

  @override
  FutureProvider<List<TVShow>> getProviderOverride(
    covariant GetTrendingTVShowsProvider provider,
  ) {
    return call(
      provider.timeWindow,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getTrendingTVShowsProvider';
}
