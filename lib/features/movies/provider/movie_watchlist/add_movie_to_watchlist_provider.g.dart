// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_movie_to_watchlist_provider.dart';

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

String _$addMovieToWatchlistHash() =>
    r'41b8f373315133deb7e6922963c057c3d9880363';

/// See also [addMovieToWatchlist].
class AddMovieToWatchlistProvider extends AutoDisposeFutureProvider<void> {
  AddMovieToWatchlistProvider({
    required this.user,
    required this.movieId,
    required this.watchlist,
  }) : super(
          (ref) => addMovieToWatchlist(
            ref,
            user: user,
            movieId: movieId,
            watchlist: watchlist,
          ),
          from: addMovieToWatchlistProvider,
          name: r'addMovieToWatchlistProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addMovieToWatchlistHash,
        );

  final User user;
  final int movieId;
  final bool watchlist;

  @override
  bool operator ==(Object other) {
    return other is AddMovieToWatchlistProvider &&
        other.user == user &&
        other.movieId == movieId &&
        other.watchlist == watchlist;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);
    hash = _SystemHash.combine(hash, watchlist.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef AddMovieToWatchlistRef = AutoDisposeFutureProviderRef<void>;

/// See also [addMovieToWatchlist].
final addMovieToWatchlistProvider = AddMovieToWatchlistFamily();

class AddMovieToWatchlistFamily extends Family<AsyncValue<void>> {
  AddMovieToWatchlistFamily();

  AddMovieToWatchlistProvider call({
    required User user,
    required int movieId,
    required bool watchlist,
  }) {
    return AddMovieToWatchlistProvider(
      user: user,
      movieId: movieId,
      watchlist: watchlist,
    );
  }

  @override
  AutoDisposeFutureProvider<void> getProviderOverride(
    covariant AddMovieToWatchlistProvider provider,
  ) {
    return call(
      user: provider.user,
      movieId: provider.movieId,
      watchlist: provider.watchlist,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'addMovieToWatchlistProvider';
}
