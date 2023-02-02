// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_movie_to_favorites_provider.dart';

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

String _$addMovieToFavoritesHash() =>
    r'5b9b4ec012d0e7fc8cc3dae6b510cdef257c398d';

/// See also [addMovieToFavorites].
class AddMovieToFavoritesProvider extends AutoDisposeFutureProvider<void> {
  AddMovieToFavoritesProvider({
    required this.user,
    required this.movieId,
    required this.favorite,
  }) : super(
          (ref) => addMovieToFavorites(
            ref,
            user: user,
            movieId: movieId,
            favorite: favorite,
          ),
          from: addMovieToFavoritesProvider,
          name: r'addMovieToFavoritesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addMovieToFavoritesHash,
        );

  final User user;
  final int movieId;
  final bool favorite;

  @override
  bool operator ==(Object other) {
    return other is AddMovieToFavoritesProvider &&
        other.user == user &&
        other.movieId == movieId &&
        other.favorite == favorite;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);
    hash = _SystemHash.combine(hash, favorite.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef AddMovieToFavoritesRef = AutoDisposeFutureProviderRef<void>;

/// See also [addMovieToFavorites].
final addMovieToFavoritesProvider = AddMovieToFavoritesFamily();

class AddMovieToFavoritesFamily extends Family<AsyncValue<void>> {
  AddMovieToFavoritesFamily();

  AddMovieToFavoritesProvider call({
    required User user,
    required int movieId,
    required bool favorite,
  }) {
    return AddMovieToFavoritesProvider(
      user: user,
      movieId: movieId,
      favorite: favorite,
    );
  }

  @override
  AutoDisposeFutureProvider<void> getProviderOverride(
    covariant AddMovieToFavoritesProvider provider,
  ) {
    return call(
      user: provider.user,
      movieId: provider.movieId,
      favorite: provider.favorite,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'addMovieToFavoritesProvider';
}
