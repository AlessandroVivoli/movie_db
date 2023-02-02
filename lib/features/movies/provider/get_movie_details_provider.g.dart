// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_details_provider.dart';

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

String _$getMovieDetailsHash() => r'3642c97205d812e3b5166104bfa8e61198d66110';

/// See also [getMovieDetails].
class GetMovieDetailsProvider extends FutureProvider<MovieDetails> {
  GetMovieDetailsProvider(
    this.movieId,
  ) : super(
          (ref) => getMovieDetails(
            ref,
            movieId,
          ),
          from: getMovieDetailsProvider,
          name: r'getMovieDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMovieDetailsHash,
        );

  final int movieId;

  @override
  bool operator ==(Object other) {
    return other is GetMovieDetailsProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetMovieDetailsRef = FutureProviderRef<MovieDetails>;

/// See also [getMovieDetails].
final getMovieDetailsProvider = GetMovieDetailsFamily();

class GetMovieDetailsFamily extends Family<AsyncValue<MovieDetails>> {
  GetMovieDetailsFamily();

  GetMovieDetailsProvider call(
    int movieId,
  ) {
    return GetMovieDetailsProvider(
      movieId,
    );
  }

  @override
  FutureProvider<MovieDetails> getProviderOverride(
    covariant GetMovieDetailsProvider provider,
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
  String? get name => r'getMovieDetailsProvider';
}
