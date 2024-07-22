// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_blocking_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isBlockingStateHash() => r'abaabbd59b74750dbc3d63b44d236515b9d6c532';

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

abstract class _$IsBlockingState
    extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final String profileId;

  FutureOr<bool> build(
    String profileId,
  );
}

/// See also [IsBlockingState].
@ProviderFor(IsBlockingState)
const isBlockingStateProvider = IsBlockingStateFamily();

/// See also [IsBlockingState].
class IsBlockingStateFamily extends Family<AsyncValue<bool>> {
  /// See also [IsBlockingState].
  const IsBlockingStateFamily();

  /// See also [IsBlockingState].
  IsBlockingStateProvider call(
    String profileId,
  ) {
    return IsBlockingStateProvider(
      profileId,
    );
  }

  @override
  IsBlockingStateProvider getProviderOverride(
    covariant IsBlockingStateProvider provider,
  ) {
    return call(
      provider.profileId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isBlockingStateProvider';
}

/// See also [IsBlockingState].
class IsBlockingStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<IsBlockingState, bool> {
  /// See also [IsBlockingState].
  IsBlockingStateProvider(
    String profileId,
  ) : this._internal(
          () => IsBlockingState()..profileId = profileId,
          from: isBlockingStateProvider,
          name: r'isBlockingStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isBlockingStateHash,
          dependencies: IsBlockingStateFamily._dependencies,
          allTransitiveDependencies:
              IsBlockingStateFamily._allTransitiveDependencies,
          profileId: profileId,
        );

  IsBlockingStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.profileId,
  }) : super.internal();

  final String profileId;

  @override
  FutureOr<bool> runNotifierBuild(
    covariant IsBlockingState notifier,
  ) {
    return notifier.build(
      profileId,
    );
  }

  @override
  Override overrideWith(IsBlockingState Function() create) {
    return ProviderOverride(
      origin: this,
      override: IsBlockingStateProvider._internal(
        () => create()..profileId = profileId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        profileId: profileId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<IsBlockingState, bool>
      createElement() {
    return _IsBlockingStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsBlockingStateProvider && other.profileId == profileId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, profileId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsBlockingStateRef on AutoDisposeAsyncNotifierProviderRef<bool> {
  /// The parameter `profileId` of this provider.
  String get profileId;
}

class _IsBlockingStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<IsBlockingState, bool>
    with IsBlockingStateRef {
  _IsBlockingStateProviderElement(super.provider);

  @override
  String get profileId => (origin as IsBlockingStateProvider).profileId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
