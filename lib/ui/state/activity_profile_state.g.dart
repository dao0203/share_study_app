// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_profile_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activityProfileStateHash() =>
    r'dc8f75157149c35e69dbc7e74c6651d3f40218a4';

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

abstract class _$ActivityProfileState
    extends BuildlessAutoDisposeAsyncNotifier<ActivityProfile> {
  late final String param;

  Future<ActivityProfile> build(
    String param,
  );
}

/// See also [ActivityProfileState].
@ProviderFor(ActivityProfileState)
const activityProfileStateProvider = ActivityProfileStateFamily();

/// See also [ActivityProfileState].
class ActivityProfileStateFamily extends Family<AsyncValue<ActivityProfile>> {
  /// See also [ActivityProfileState].
  const ActivityProfileStateFamily();

  /// See also [ActivityProfileState].
  ActivityProfileStateProvider call(
    String param,
  ) {
    return ActivityProfileStateProvider(
      param,
    );
  }

  @override
  ActivityProfileStateProvider getProviderOverride(
    covariant ActivityProfileStateProvider provider,
  ) {
    return call(
      provider.param,
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
  String? get name => r'activityProfileStateProvider';
}

/// See also [ActivityProfileState].
class ActivityProfileStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ActivityProfileState, ActivityProfile> {
  /// See also [ActivityProfileState].
  ActivityProfileStateProvider(
    String param,
  ) : this._internal(
          () => ActivityProfileState()..param = param,
          from: activityProfileStateProvider,
          name: r'activityProfileStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$activityProfileStateHash,
          dependencies: ActivityProfileStateFamily._dependencies,
          allTransitiveDependencies:
              ActivityProfileStateFamily._allTransitiveDependencies,
          param: param,
        );

  ActivityProfileStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.param,
  }) : super.internal();

  final String param;

  @override
  Future<ActivityProfile> runNotifierBuild(
    covariant ActivityProfileState notifier,
  ) {
    return notifier.build(
      param,
    );
  }

  @override
  Override overrideWith(ActivityProfileState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ActivityProfileStateProvider._internal(
        () => create()..param = param,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        param: param,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ActivityProfileState, ActivityProfile>
      createElement() {
    return _ActivityProfileStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActivityProfileStateProvider && other.param == param;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, param.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ActivityProfileStateRef
    on AutoDisposeAsyncNotifierProviderRef<ActivityProfile> {
  /// The parameter `param` of this provider.
  String get param;
}

class _ActivityProfileStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ActivityProfileState,
        ActivityProfile> with ActivityProfileStateRef {
  _ActivityProfileStateProviderElement(super.provider);

  @override
  String get param => (origin as ActivityProfileStateProvider).param;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
