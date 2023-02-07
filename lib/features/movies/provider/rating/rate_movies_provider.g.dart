// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_movies_provider.dart';

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

String _$RateMoviesHash() => r'1e0b43b2f08a72c2fcd37b7d6995e6a44e4f79e0';

/// See also [RateMovies].
final rateMoviesProvider = AutoDisposeNotifierProvider<RateMovies, RateState>(
  RateMovies.new,
  name: r'rateMoviesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$RateMoviesHash,
);
typedef RateMoviesRef = AutoDisposeNotifierProviderRef<RateState>;

abstract class _$RateMovies extends AutoDisposeNotifier<RateState> {
  @override
  RateState build();
}
