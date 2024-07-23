// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_following_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isFollowingStateHash() => r'c20345b01bc2c0457df67bee151426767217b9c8';

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

abstract class _$IsFollowingState
    extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final String profileId;

  FutureOr<bool> build(
    String profileId,
  );
}

/// See also [IsFollowingState].
@ProviderFor(IsFollowingState)
const isFollowingStateProvider = IsFollowingStateFamily();

/// See also [IsFollowingState].
class IsFollowingStateFamily extends Family<AsyncValue<bool>> {
  /// See also [IsFollowingState].
  const IsFollowingStateFamily();

  /// See also [IsFollowingState].
  IsFollowingStateProvider call(
    String profileId,
  ) {
    return IsFollowingStateProvider(
      profileId,
    );
  }

  @override
  IsFollowingStateProvider getProviderOverride(
    covariant IsFollowingStateProvider provider,
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
  String? get name => r'isFollowingStateProvider';
}

/// See also [IsFollowingState].
class IsFollowingStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<IsFollowingState, bool> {
  /// See also [IsFollowingState].
  IsFollowingStateProvider(
    String profileId,
  ) : this._internal(
          () => IsFollowingState()..profileId = profileId,
          from: isFollowingStateProvider,
          name: r'isFollowingStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFollowingStateHash,
          dependencies: IsFollowingStateFamily._dependencies,
          allTransitiveDependencies:
              IsFollowingStateFamily._allTransitiveDependencies,
          profileId: profileId,
        );

  IsFollowingStateProvider._internal(
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
    covariant IsFollowingState notifier,
  ) {
    return notifier.build(
      profileId,
    );
  }

  @override
  Override overrideWith(IsFollowingState Function() create) {
    return ProviderOverride(
      origin: this,
      override: IsFollowingStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<IsFollowingState, bool>
      createElement() {
    return _IsFollowingStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsFollowingStateProvider && other.profileId == profileId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, profileId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsFollowingStateRef on AutoDisposeAsyncNotifierProviderRef<bool> {
  /// The parameter `profileId` of this provider.
  String get profileId;
}

class _IsFollowingStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<IsFollowingState, bool>
    with IsFollowingStateRef {
  _IsFollowingStateProviderElement(super.provider);

  @override
  String get profileId => (origin as IsFollowingStateProvider).profileId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
