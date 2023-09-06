// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_rated_tv_shows_provider.dart';

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

String _$getRatedTVShowsHash() => r'2da3efddb0fcdfe0fff4f7aa641816ab594c63a6';

/// See also [getRatedTVShows].
class GetRatedTVShowsProvider extends AutoDisposeFutureProvider<TVListModel> {
  GetRatedTVShowsProvider({
    this.page = 1,
  }) : super(
          (ref) => getRatedTVShows(
            ref,
            page: page,
          ),
          from: getRatedTVShowsProvider,
          name: r'getRatedTVShowsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getRatedTVShowsHash,
        );

  final int page;

  @override
  bool operator ==(Object other) {
    return other is GetRatedTVShowsProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetRatedTVShowsRef = AutoDisposeFutureProviderRef<TVListModel>;

/// See also [getRatedTVShows].
final getRatedTVShowsProvider = GetRatedTVShowsFamily();

class GetRatedTVShowsFamily extends Family<AsyncValue<TVListModel>> {
  GetRatedTVShowsFamily();

  GetRatedTVShowsProvider call({
    int page = 1,
  }) {
    return GetRatedTVShowsProvider(
      page: page,
    );
  }

  @override
  AutoDisposeFutureProvider<TVListModel> getProviderOverride(
    covariant GetRatedTVShowsProvider provider,
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
  String? get name => r'getRatedTVShowsProvider';
}
