// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_person_credits_provider.dart';

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

String _$getPersonCreditsHash() => r'c0edd7e17e8fca5f7bace45d164b6ec405b6d144';

/// See also [getPersonCredits].
class GetPersonCreditsProvider extends AutoDisposeFutureProvider<List<Movie>> {
  GetPersonCreditsProvider(
    this.personId,
  ) : super(
          (ref) => getPersonCredits(
            ref,
            personId,
          ),
          from: getPersonCreditsProvider,
          name: r'getPersonCreditsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPersonCreditsHash,
        );

  final int personId;

  @override
  bool operator ==(Object other) {
    return other is GetPersonCreditsProvider && other.personId == personId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, personId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetPersonCreditsRef = AutoDisposeFutureProviderRef<List<Movie>>;

/// See also [getPersonCredits].
final getPersonCreditsProvider = GetPersonCreditsFamily();

class GetPersonCreditsFamily extends Family<AsyncValue<List<Movie>>> {
  GetPersonCreditsFamily();

  GetPersonCreditsProvider call(
    int personId,
  ) {
    return GetPersonCreditsProvider(
      personId,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Movie>> getProviderOverride(
    covariant GetPersonCreditsProvider provider,
  ) {
    return call(
      provider.personId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getPersonCreditsProvider';
}
