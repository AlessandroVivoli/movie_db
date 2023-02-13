// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tv_shows_provider.dart';

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

String _$getTVShowsHash() => r'5b6b7269f9fb91104d96627530186b63f77a3416';

/// See also [getTVShows].
class GetTVShowsProvider extends FutureProvider<List<TVShow>> {
  GetTVShowsProvider(
    this.args,
  ) : super(
          (ref) => getTVShows(
            ref,
            args,
          ),
          from: getTVShowsProvider,
          name: r'getTVShowsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTVShowsHash,
        );

  final MediaArguments args;

  @override
  bool operator ==(Object other) {
    return other is GetTVShowsProvider && other.args == args;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, args.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetTVShowsRef = FutureProviderRef<List<TVShow>>;

/// See also [getTVShows].
final getTVShowsProvider = GetTVShowsFamily();

class GetTVShowsFamily extends Family<AsyncValue<List<TVShow>>> {
  GetTVShowsFamily();

  GetTVShowsProvider call(
    MediaArguments args,
  ) {
    return GetTVShowsProvider(
      args,
    );
  }

  @override
  FutureProvider<List<TVShow>> getProviderOverride(
    covariant GetTVShowsProvider provider,
  ) {
    return call(
      provider.args,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getTVShowsProvider';
}
