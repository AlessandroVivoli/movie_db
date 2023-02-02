// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movies_provider.dart';

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

String _$getMoviesHash() => r'ffcbd0a76ce14875de852392fcc684672b30d38f';

/// See also [getMovies].
class GetMoviesProvider extends AutoDisposeFutureProvider<List<Movie>> {
  GetMoviesProvider({
    this.withGenres,
    this.sortBy = SortBy.popularityDesc,
    this.includeAdult = false,
  }) : super(
          (ref) => getMovies(
            ref,
            withGenres: withGenres,
            sortBy: sortBy,
            includeAdult: includeAdult,
          ),
          from: getMoviesProvider,
          name: r'getMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMoviesHash,
        );

  final List<int>? withGenres;
  final SortBy sortBy;
  final bool includeAdult;

  @override
  bool operator ==(Object other) {
    return other is GetMoviesProvider &&
        other.withGenres == withGenres &&
        other.sortBy == sortBy &&
        other.includeAdult == includeAdult;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, withGenres.hashCode);
    hash = _SystemHash.combine(hash, sortBy.hashCode);
    hash = _SystemHash.combine(hash, includeAdult.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetMoviesRef = AutoDisposeFutureProviderRef<List<Movie>>;

/// See also [getMovies].
final getMoviesProvider = GetMoviesFamily();

class GetMoviesFamily extends Family<AsyncValue<List<Movie>>> {
  GetMoviesFamily();

  GetMoviesProvider call({
    List<int>? withGenres,
    SortBy sortBy = SortBy.popularityDesc,
    bool includeAdult = false,
  }) {
    return GetMoviesProvider(
      withGenres: withGenres,
      sortBy: sortBy,
      includeAdult: includeAdult,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Movie>> getProviderOverride(
    covariant GetMoviesProvider provider,
  ) {
    return call(
      withGenres: provider.withGenres,
      sortBy: provider.sortBy,
      includeAdult: provider.includeAdult,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getMoviesProvider';
}
