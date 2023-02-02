// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_similar_movies_provider.dart';

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

String _$getSimilarMoviesHash() => r'751ce7be7c89e0a938ba808a5d293cf8d4c709c7';

/// See also [getSimilarMovies].
class GetSimilarMoviesProvider extends FutureProvider<List<Movie>> {
  GetSimilarMoviesProvider(
    this.movieId,
  ) : super(
          (ref) => getSimilarMovies(
            ref,
            movieId,
          ),
          from: getSimilarMoviesProvider,
          name: r'getSimilarMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSimilarMoviesHash,
        );

  final int movieId;

  @override
  bool operator ==(Object other) {
    return other is GetSimilarMoviesProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetSimilarMoviesRef = FutureProviderRef<List<Movie>>;

/// See also [getSimilarMovies].
final getSimilarMoviesProvider = GetSimilarMoviesFamily();

class GetSimilarMoviesFamily extends Family<AsyncValue<List<Movie>>> {
  GetSimilarMoviesFamily();

  GetSimilarMoviesProvider call(
    int movieId,
  ) {
    return GetSimilarMoviesProvider(
      movieId,
    );
  }

  @override
  FutureProvider<List<Movie>> getProviderOverride(
    covariant GetSimilarMoviesProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getSimilarMoviesProvider';
}
