// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_videos_provider.dart';

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

String _$getVideosHash() => r'be01ffb3c7f746234827810f44626611657da387';

/// See also [getVideos].
class GetVideosProvider extends AutoDisposeFutureProvider<List<Video>> {
  GetVideosProvider(
    this.movieId,
  ) : super(
          (ref) => getVideos(
            ref,
            movieId,
          ),
          from: getVideosProvider,
          name: r'getVideosProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getVideosHash,
        );

  final int movieId;

  @override
  bool operator ==(Object other) {
    return other is GetVideosProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetVideosRef = AutoDisposeFutureProviderRef<List<Video>>;

/// See also [getVideos].
final getVideosProvider = GetVideosFamily();

class GetVideosFamily extends Family<AsyncValue<List<Video>>> {
  GetVideosFamily();

  GetVideosProvider call(
    int movieId,
  ) {
    return GetVideosProvider(
      movieId,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Video>> getProviderOverride(
    covariant GetVideosProvider provider,
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
  String? get name => r'getVideosProvider';
}
