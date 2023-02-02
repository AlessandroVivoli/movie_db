// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_person_images_provider.dart';

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

String _$getPersonImagesHash() => r'05103188d171a1fb8ba5cd66d820478f861da378';

/// See also [getPersonImages].
class GetPersonImagesProvider
    extends AutoDisposeFutureProvider<List<ImageModel>> {
  GetPersonImagesProvider(
    this.personId,
  ) : super(
          (ref) => getPersonImages(
            ref,
            personId,
          ),
          from: getPersonImagesProvider,
          name: r'getPersonImagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPersonImagesHash,
        );

  final int personId;

  @override
  bool operator ==(Object other) {
    return other is GetPersonImagesProvider && other.personId == personId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, personId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetPersonImagesRef = AutoDisposeFutureProviderRef<List<ImageModel>>;

/// See also [getPersonImages].
final getPersonImagesProvider = GetPersonImagesFamily();

class GetPersonImagesFamily extends Family<AsyncValue<List<ImageModel>>> {
  GetPersonImagesFamily();

  GetPersonImagesProvider call(
    int personId,
  ) {
    return GetPersonImagesProvider(
      personId,
    );
  }

  @override
  AutoDisposeFutureProvider<List<ImageModel>> getProviderOverride(
    covariant GetPersonImagesProvider provider,
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
  String? get name => r'getPersonImagesProvider';
}
