// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_person_details_provider.dart';

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

String _$getPersonDetailsHash() => r'4bbbc57f8d5d98158aabc1757d0ee055a1bc8741';

/// See also [getPersonDetails].
class GetPersonDetailsProvider
    extends AutoDisposeFutureProvider<PersonDetails> {
  GetPersonDetailsProvider(
    this.personId,
  ) : super(
          (ref) => getPersonDetails(
            ref,
            personId,
          ),
          from: getPersonDetailsProvider,
          name: r'getPersonDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPersonDetailsHash,
        );

  final int personId;

  @override
  bool operator ==(Object other) {
    return other is GetPersonDetailsProvider && other.personId == personId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, personId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetPersonDetailsRef = AutoDisposeFutureProviderRef<PersonDetails>;

/// See also [getPersonDetails].
final getPersonDetailsProvider = GetPersonDetailsFamily();

class GetPersonDetailsFamily extends Family<AsyncValue<PersonDetails>> {
  GetPersonDetailsFamily();

  GetPersonDetailsProvider call(
    int personId,
  ) {
    return GetPersonDetailsProvider(
      personId,
    );
  }

  @override
  AutoDisposeFutureProvider<PersonDetails> getProviderOverride(
    covariant GetPersonDetailsProvider provider,
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
  String? get name => r'getPersonDetailsProvider';
}
