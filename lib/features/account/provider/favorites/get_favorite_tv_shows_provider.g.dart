// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorite_tv_shows_provider.dart';

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

String _$getFavoriteTVShowsHash() =>
    r'72844dafc7a5aaa8f135c101611d50cb3429e1df';

/// See also [getFavoriteTVShows].
class GetFavoriteTVShowsProvider
    extends AutoDisposeFutureProvider<TVListModel> {
  GetFavoriteTVShowsProvider({
    this.page = 1,
  }) : super(
          (ref) => getFavoriteTVShows(
            ref,
            page: page,
          ),
          from: getFavoriteTVShowsProvider,
          name: r'getFavoriteTVShowsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getFavoriteTVShowsHash,
        );

  final int page;

  @override
  bool operator ==(Object other) {
    return other is GetFavoriteTVShowsProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetFavoriteTVShowsRef = AutoDisposeFutureProviderRef<TVListModel>;

/// See also [getFavoriteTVShows].
final getFavoriteTVShowsProvider = GetFavoriteTVShowsFamily();

class GetFavoriteTVShowsFamily extends Family<AsyncValue<TVListModel>> {
  GetFavoriteTVShowsFamily();

  GetFavoriteTVShowsProvider call({
    int page = 1,
  }) {
    return GetFavoriteTVShowsProvider(
      page: page,
    );
  }

  @override
  AutoDisposeFutureProvider<TVListModel> getProviderOverride(
    covariant GetFavoriteTVShowsProvider provider,
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
  String? get name => r'getFavoriteTVShowsProvider';
}
