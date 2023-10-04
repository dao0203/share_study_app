// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_ui_model_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionUiModelStateHash() =>
    r'f612bc5403cca857aedffb84701d026caaa1dda8';

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

abstract class _$QuestionUiModelState
    extends BuildlessAutoDisposeAsyncNotifier<QuestionUiModel> {
  late final String questionId;

  Future<QuestionUiModel> build(
    String questionId,
  );
}

/// See also [QuestionUiModelState].
@ProviderFor(QuestionUiModelState)
const questionUiModelStateProvider = QuestionUiModelStateFamily();

/// See also [QuestionUiModelState].
class QuestionUiModelStateFamily extends Family<AsyncValue<QuestionUiModel>> {
  /// See also [QuestionUiModelState].
  const QuestionUiModelStateFamily();

  /// See also [QuestionUiModelState].
  QuestionUiModelStateProvider call(
    String questionId,
  ) {
    return QuestionUiModelStateProvider(
      questionId,
    );
  }

  @override
  QuestionUiModelStateProvider getProviderOverride(
    covariant QuestionUiModelStateProvider provider,
  ) {
    return call(
      provider.questionId,
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
  String? get name => r'questionUiModelStateProvider';
}

/// See also [QuestionUiModelState].
class QuestionUiModelStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    QuestionUiModelState, QuestionUiModel> {
  /// See also [QuestionUiModelState].
  QuestionUiModelStateProvider(
    String questionId,
  ) : this._internal(
          () => QuestionUiModelState()..questionId = questionId,
          from: questionUiModelStateProvider,
          name: r'questionUiModelStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$questionUiModelStateHash,
          dependencies: QuestionUiModelStateFamily._dependencies,
          allTransitiveDependencies:
              QuestionUiModelStateFamily._allTransitiveDependencies,
          questionId: questionId,
        );

  QuestionUiModelStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.questionId,
  }) : super.internal();

  final String questionId;

  @override
  Future<QuestionUiModel> runNotifierBuild(
    covariant QuestionUiModelState notifier,
  ) {
    return notifier.build(
      questionId,
    );
  }

  @override
  Override overrideWith(QuestionUiModelState Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuestionUiModelStateProvider._internal(
        () => create()..questionId = questionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        questionId: questionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<QuestionUiModelState, QuestionUiModel>
      createElement() {
    return _QuestionUiModelStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionUiModelStateProvider &&
        other.questionId == questionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, questionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuestionUiModelStateRef
    on AutoDisposeAsyncNotifierProviderRef<QuestionUiModel> {
  /// The parameter `questionId` of this provider.
  String get questionId;
}

class _QuestionUiModelStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<QuestionUiModelState,
        QuestionUiModel> with QuestionUiModelStateRef {
  _QuestionUiModelStateProviderElement(super.provider);

  @override
  String get questionId => (origin as QuestionUiModelStateProvider).questionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
