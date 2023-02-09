// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_watchlist_provider.dart';

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

String _$getMovieWatchlistHash() => r'0da1fbcce1c814a42de447629a0d54202da5d567';

/// See also [getMovieWatchlist].
class GetMovieWatchlistProvider
    extends AutoDisposeFutureProvider<MovieListModel> {
  GetMovieWatchlistProvider({
    this.page = 1,
  }) : super(
          (ref) => getMovieWatchlist(
            ref,
            page: page,
          ),
          from: getMovieWatchlistProvider,
          name: r'getMovieWatchlistProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMovieWatchlistHash,
        );

  final int page;

  @override
  bool operator ==(Object other) {
    return other is GetMovieWatchlistProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetMovieWatchlistRef = AutoDisposeFutureProviderRef<MovieListModel>;

/// See also [getMovieWatchlist].
final getMovieWatchlistProvider = GetMovieWatchlistFamily();

class GetMovieWatchlistFamily extends Family<AsyncValue<MovieListModel>> {
  GetMovieWatchlistFamily();

  GetMovieWatchlistProvider call({
    int page = 1,
  }) {
    return GetMovieWatchlistProvider(
      page: page,
    );
  }

  @override
  AutoDisposeFutureProvider<MovieListModel> getProviderOverride(
    covariant GetMovieWatchlistProvider provider,
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
  String? get name => r'getMovieWatchlistProvider';
}
