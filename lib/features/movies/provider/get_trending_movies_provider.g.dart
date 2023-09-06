// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trending_movies_provider.dart';

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

String _$getTrendingMoviesHash() => r'8f79a51cd153f186268888b65ff54bfaff52a522';

/// See also [getTrendingMovies].
class GetTrendingMoviesProvider extends FutureProvider<List<Movie>> {
  GetTrendingMoviesProvider(
    this.timeWindow,
  ) : super(
          (ref) => getTrendingMovies(
            ref,
            timeWindow,
          ),
          from: getTrendingMoviesProvider,
          name: r'getTrendingMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTrendingMoviesHash,
        );

  final String timeWindow;

  @override
  bool operator ==(Object other) {
    return other is GetTrendingMoviesProvider && other.timeWindow == timeWindow;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, timeWindow.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetTrendingMoviesRef = FutureProviderRef<List<Movie>>;

/// See also [getTrendingMovies].
final getTrendingMoviesProvider = GetTrendingMoviesFamily();

class GetTrendingMoviesFamily extends Family<AsyncValue<List<Movie>>> {
  GetTrendingMoviesFamily();

  GetTrendingMoviesProvider call(
    String timeWindow,
  ) {
    return GetTrendingMoviesProvider(
      timeWindow,
    );
  }

  @override
  FutureProvider<List<Movie>> getProviderOverride(
    covariant GetTrendingMoviesProvider provider,
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
  String? get name => r'getTrendingMoviesProvider';
}
