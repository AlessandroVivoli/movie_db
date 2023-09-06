// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_images_provider.dart';

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

String _$movieImagesHash() => r'3da4bd4cdb935d2b6870b896741fe09afb7ee118';

/// See also [movieImages].
class MovieImagesProvider extends AutoDisposeFutureProvider<MediaImages> {
  MovieImagesProvider(
    this.movieId,
  ) : super(
          (ref) => movieImages(
            ref,
            movieId,
          ),
          from: movieImagesProvider,
          name: r'movieImagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieImagesHash,
        );

  final int movieId;

  @override
  bool operator ==(Object other) {
    return other is MovieImagesProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef MovieImagesRef = AutoDisposeFutureProviderRef<MediaImages>;

/// See also [movieImages].
final movieImagesProvider = MovieImagesFamily();

class MovieImagesFamily extends Family<AsyncValue<MediaImages>> {
  MovieImagesFamily();

  MovieImagesProvider call(
    int movieId,
  ) {
    return MovieImagesProvider(
      movieId,
    );
  }

  @override
  AutoDisposeFutureProvider<MediaImages> getProviderOverride(
    covariant MovieImagesProvider provider,
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
  String? get name => r'movieImagesProvider';
}
