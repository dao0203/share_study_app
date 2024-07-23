// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionStateHash() => r'ec1a3bf24e3da73a0454eceeba459fd8fa8ed2d2';

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

abstract class _$QuestionState
    extends BuildlessAutoDisposeAsyncNotifier<Question> {
  late final String questionId;

  FutureOr<Question> build(
    String questionId,
  );
}

/// See also [QuestionState].
@ProviderFor(QuestionState)
const questionStateProvider = QuestionStateFamily();

/// See also [QuestionState].
class QuestionStateFamily extends Family<AsyncValue<Question>> {
  /// See also [QuestionState].
  const QuestionStateFamily();

  /// See also [QuestionState].
  QuestionStateProvider call(
    String questionId,
  ) {
    return QuestionStateProvider(
      questionId,
    );
  }

  @override
  QuestionStateProvider getProviderOverride(
    covariant QuestionStateProvider provider,
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
  String? get name => r'questionStateProvider';
}

/// See also [QuestionState].
class QuestionStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<QuestionState, Question> {
  /// See also [QuestionState].
  QuestionStateProvider(
    String questionId,
  ) : this._internal(
          () => QuestionState()..questionId = questionId,
          from: questionStateProvider,
          name: r'questionStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$questionStateHash,
          dependencies: QuestionStateFamily._dependencies,
          allTransitiveDependencies:
              QuestionStateFamily._allTransitiveDependencies,
          questionId: questionId,
        );

  QuestionStateProvider._internal(
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
  FutureOr<Question> runNotifierBuild(
    covariant QuestionState notifier,
  ) {
    return notifier.build(
      questionId,
    );
  }

  @override
  Override overrideWith(QuestionState Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuestionStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<QuestionState, Question>
      createElement() {
    return _QuestionStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionStateProvider && other.questionId == questionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, questionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuestionStateRef on AutoDisposeAsyncNotifierProviderRef<Question> {
  /// The parameter `questionId` of this provider.
  String get questionId;
}

class _QuestionStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<QuestionState, Question>
    with QuestionStateRef {
  _QuestionStateProviderElement(super.provider);

  @override
  String get questionId => (origin as QuestionStateProvider).questionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
