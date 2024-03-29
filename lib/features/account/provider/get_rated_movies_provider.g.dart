// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_rated_movies_provider.dart';

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

String _$getRatedMoviesHash() => r'0f8be7ec8a265d9a89e8247b52d84a9e9a54c52d';

/// See also [getRatedMovies].
class GetRatedMoviesProvider extends AutoDisposeFutureProvider<MovieListModel> {
  GetRatedMoviesProvider({
    this.page = 1,
  }) : super(
          (ref) => getRatedMovies(
            ref,
            page: page,
          ),
          from: getRatedMoviesProvider,
          name: r'getRatedMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getRatedMoviesHash,
        );

  final int page;

  @override
  bool operator ==(Object other) {
    return other is GetRatedMoviesProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetRatedMoviesRef = AutoDisposeFutureProviderRef<MovieListModel>;

/// See also [getRatedMovies].
final getRatedMoviesProvider = GetRatedMoviesFamily();

class GetRatedMoviesFamily extends Family<AsyncValue<MovieListModel>> {
  GetRatedMoviesFamily();

  GetRatedMoviesProvider call({
    int page = 1,
  }) {
    return GetRatedMoviesProvider(
      page: page,
    );
  }

  @override
  AutoDisposeFutureProvider<MovieListModel> getProviderOverride(
    covariant GetRatedMoviesProvider provider,
  ) {
    return call(
      page: provider.page,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getRatedMoviesProvider';
}
