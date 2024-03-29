// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorite_movies_provider.dart';

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

String _$getFavoriteMoviesHash() => r'69af34a1d365c014e2da9b9d66d06dfd22b3fea9';

/// See also [getFavoriteMovies].
class GetFavoriteMoviesProvider
    extends AutoDisposeFutureProvider<MovieListModel> {
  GetFavoriteMoviesProvider({
    this.page = 1,
  }) : super(
          (ref) => getFavoriteMovies(
            ref,
            page: page,
          ),
          from: getFavoriteMoviesProvider,
          name: r'getFavoriteMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getFavoriteMoviesHash,
        );

  final int page;

  @override
  bool operator ==(Object other) {
    return other is GetFavoriteMoviesProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetFavoriteMoviesRef = AutoDisposeFutureProviderRef<MovieListModel>;

/// See also [getFavoriteMovies].
final getFavoriteMoviesProvider = GetFavoriteMoviesFamily();

class GetFavoriteMoviesFamily extends Family<AsyncValue<MovieListModel>> {
  GetFavoriteMoviesFamily();

  GetFavoriteMoviesProvider call({
    int page = 1,
  }) {
    return GetFavoriteMoviesProvider(
      page: page,
    );
  }

  @override
  AutoDisposeFutureProvider<MovieListModel> getProviderOverride(
    covariant GetFavoriteMoviesProvider provider,
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
  String? get name => r'getFavoriteMoviesProvider';
}
