// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movies_provider.dart';

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

String _$searchMoviesHash() => r'bba1ec0b796cc33f0bf3dacf122e99fa6b01957e';

/// See also [searchMovies].
class SearchMoviesProvider extends AutoDisposeFutureProvider<MovieListModel> {
  SearchMoviesProvider({
    required this.query,
    this.includeAdult = false,
    this.page = 1,
  }) : super(
          (ref) => searchMovies(
            ref,
            query: query,
            includeAdult: includeAdult,
            page: page,
          ),
          from: searchMoviesProvider,
          name: r'searchMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchMoviesHash,
        );

  final String query;
  final bool includeAdult;
  final int page;

  @override
  bool operator ==(Object other) {
    return other is SearchMoviesProvider &&
        other.query == query &&
        other.includeAdult == includeAdult &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);
    hash = _SystemHash.combine(hash, includeAdult.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SearchMoviesRef = AutoDisposeFutureProviderRef<MovieListModel>;

/// See also [searchMovies].
final searchMoviesProvider = SearchMoviesFamily();

class SearchMoviesFamily extends Family<AsyncValue<MovieListModel>> {
  SearchMoviesFamily();

  SearchMoviesProvider call({
    required String query,
    bool includeAdult = false,
    int page = 1,
  }) {
    return SearchMoviesProvider(
      query: query,
      includeAdult: includeAdult,
      page: page,
    );
  }

  @override
  AutoDisposeFutureProvider<MovieListModel> getProviderOverride(
    covariant SearchMoviesProvider provider,
  ) {
    return call(
      query: provider.query,
      includeAdult: provider.includeAdult,
      page: provider.page,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'searchMoviesProvider';
}
