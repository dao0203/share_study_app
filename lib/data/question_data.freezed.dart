// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionData _$QuestionDataFromJson(Map<String, dynamic> json) {
  return _QuestionData.fromJson(json);
}

/// @nodoc
mixin _$QuestionData {
  List<String> get dropDownLists => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get titleContent => throw _privateConstructorUsedError;
  String get questionContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionDataCopyWith<QuestionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionDataCopyWith<$Res> {
  factory $QuestionDataCopyWith(
          QuestionData value, $Res Function(QuestionData) then) =
      _$QuestionDataCopyWithImpl<$Res, QuestionData>;
  @useResult
  $Res call(
      {List<String> dropDownLists,
      String id,
      String userId,
      String titleContent,
      String questionContent});
}

/// @nodoc
class _$QuestionDataCopyWithImpl<$Res, $Val extends QuestionData>
    implements $QuestionDataCopyWith<$Res> {
  _$QuestionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dropDownLists = null,
    Object? id = null,
    Object? userId = null,
    Object? titleContent = null,
    Object? questionContent = null,
  }) {
    return _then(_value.copyWith(
      dropDownLists: null == dropDownLists
          ? _value.dropDownLists
          : dropDownLists // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      titleContent: null == titleContent
          ? _value.titleContent
          : titleContent // ignore: cast_nullable_to_non_nullable
              as String,
      questionContent: null == questionContent
          ? _value.questionContent
          : questionContent // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionDataCopyWith<$Res>
    implements $QuestionDataCopyWith<$Res> {
  factory _$$_QuestionDataCopyWith(
          _$_QuestionData value, $Res Function(_$_QuestionData) then) =
      __$$_QuestionDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> dropDownLists,
      String id,
      String userId,
      String titleContent,
      String questionContent});
}

/// @nodoc
class __$$_QuestionDataCopyWithImpl<$Res>
    extends _$QuestionDataCopyWithImpl<$Res, _$_QuestionData>
    implements _$$_QuestionDataCopyWith<$Res> {
  __$$_QuestionDataCopyWithImpl(
      _$_QuestionData _value, $Res Function(_$_QuestionData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dropDownLists = null,
    Object? id = null,
    Object? userId = null,
    Object? titleContent = null,
    Object? questionContent = null,
  }) {
    return _then(_$_QuestionData(
      dropDownLists: null == dropDownLists
          ? _value._dropDownLists
          : dropDownLists // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      titleContent: null == titleContent
          ? _value.titleContent
          : titleContent // ignore: cast_nullable_to_non_nullable
              as String,
      questionContent: null == questionContent
          ? _value.questionContent
          : questionContent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionData with DiagnosticableTreeMixin implements _QuestionData {
  const _$_QuestionData(
      {required final List<String> dropDownLists,
      required this.id,
      required this.userId,
      required this.titleContent,
      required this.questionContent})
      : _dropDownLists = dropDownLists;

  factory _$_QuestionData.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionDataFromJson(json);

  final List<String> _dropDownLists;
  @override
  List<String> get dropDownLists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dropDownLists);
  }

  @override
  final String id;
  @override
  final String userId;
  @override
  final String titleContent;
  @override
  final String questionContent;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionData(dropDownLists: $dropDownLists, id: $id, userId: $userId, titleContent: $titleContent, questionContent: $questionContent)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionData'))
      ..add(DiagnosticsProperty('dropDownLists', dropDownLists))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('titleContent', titleContent))
      ..add(DiagnosticsProperty('questionContent', questionContent));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionData &&
            const DeepCollectionEquality()
                .equals(other._dropDownLists, _dropDownLists) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.titleContent, titleContent) ||
                other.titleContent == titleContent) &&
            (identical(other.questionContent, questionContent) ||
                other.questionContent == questionContent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dropDownLists),
      id,
      userId,
      titleContent,
      questionContent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionDataCopyWith<_$_QuestionData> get copyWith =>
      __$$_QuestionDataCopyWithImpl<_$_QuestionData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionDataToJson(
      this,
    );
  }
}

abstract class _QuestionData implements QuestionData {
  const factory _QuestionData(
      {required final List<String> dropDownLists,
      required final String id,
      required final String userId,
      required final String titleContent,
      required final String questionContent}) = _$_QuestionData;

  factory _QuestionData.fromJson(Map<String, dynamic> json) =
      _$_QuestionData.fromJson;

  @override
  List<String> get dropDownLists;
  @override
  String get id;
  @override
  String get userId;
  @override
  String get titleContent;
  @override
  String get questionContent;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionDataCopyWith<_$_QuestionData> get copyWith =>
      throw _privateConstructorUsedError;
}
