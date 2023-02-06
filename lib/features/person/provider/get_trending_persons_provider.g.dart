// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trending_persons_provider.dart';

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

String _$getTrendingPersonsHash() =>
    r'1a70d60b2542b5d4e8d2869bc9c90d979b5f4687';

/// See also [getTrendingPersons].
class GetTrendingPersonsProvider
    extends AutoDisposeFutureProvider<List<Person>> {
  GetTrendingPersonsProvider(
    this.timeWindow,
  ) : super(
          (ref) => getTrendingPersons(
            ref,
            timeWindow,
          ),
          from: getTrendingPersonsProvider,
          name: r'getTrendingPersonsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTrendingPersonsHash,
        );

  final TimeWindow timeWindow;

  @override
  bool operator ==(Object other) {
    return other is GetTrendingPersonsProvider &&
        other.timeWindow == timeWindow;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, timeWindow.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetTrendingPersonsRef = AutoDisposeFutureProviderRef<List<Person>>;

/// See also [getTrendingPersons].
final getTrendingPersonsProvider = GetTrendingPersonsFamily();

class GetTrendingPersonsFamily extends Family<AsyncValue<List<Person>>> {
  GetTrendingPersonsFamily();

  GetTrendingPersonsProvider call(
    TimeWindow timeWindow,
  ) {
    return GetTrendingPersonsProvider(
      timeWindow,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Person>> getProviderOverride(
    covariant GetTrendingPersonsProvider provider,
  ) {
    return call(
      provider.timeWindow,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getTrendingPersonsProvider';
}
