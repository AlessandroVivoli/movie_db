// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_interceptor_provider.dart';

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

String _$QueryInterceptorStateHash() =>
    r'a027830d188fc4c34d0b067d6f2898c1396e945f';

/// See also [QueryInterceptorState].
final queryInterceptorStateProvider =
    NotifierProvider<QueryInterceptorState, QueryInterceptor>(
  QueryInterceptorState.new,
  name: r'queryInterceptorStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$QueryInterceptorStateHash,
);
typedef QueryInterceptorStateRef = NotifierProviderRef<QueryInterceptor>;

abstract class _$QueryInterceptorState extends Notifier<QueryInterceptor> {
  @override
  QueryInterceptor build();
}
