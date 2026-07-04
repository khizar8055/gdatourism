// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_alert_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TravelAlertModel _$TravelAlertModelFromJson(Map<String, dynamic> json) {
  return _TravelAlertModel.fromJson(json);
}

/// @nodoc
mixin _$TravelAlertModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get severity =>
      throw _privateConstructorUsedError; // high, medium, low
  String get message => throw _privateConstructorUsedError;

  /// Serializes this TravelAlertModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelAlertModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelAlertModelCopyWith<TravelAlertModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelAlertModelCopyWith<$Res> {
  factory $TravelAlertModelCopyWith(
    TravelAlertModel value,
    $Res Function(TravelAlertModel) then,
  ) = _$TravelAlertModelCopyWithImpl<$Res, TravelAlertModel>;
  @useResult
  $Res call({String id, String title, String severity, String message});
}

/// @nodoc
class _$TravelAlertModelCopyWithImpl<$Res, $Val extends TravelAlertModel>
    implements $TravelAlertModelCopyWith<$Res> {
  _$TravelAlertModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelAlertModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? severity = null,
    Object? message = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TravelAlertModelImplCopyWith<$Res>
    implements $TravelAlertModelCopyWith<$Res> {
  factory _$$TravelAlertModelImplCopyWith(
    _$TravelAlertModelImpl value,
    $Res Function(_$TravelAlertModelImpl) then,
  ) = __$$TravelAlertModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String severity, String message});
}

/// @nodoc
class __$$TravelAlertModelImplCopyWithImpl<$Res>
    extends _$TravelAlertModelCopyWithImpl<$Res, _$TravelAlertModelImpl>
    implements _$$TravelAlertModelImplCopyWith<$Res> {
  __$$TravelAlertModelImplCopyWithImpl(
    _$TravelAlertModelImpl _value,
    $Res Function(_$TravelAlertModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TravelAlertModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? severity = null,
    Object? message = null,
  }) {
    return _then(
      _$TravelAlertModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelAlertModelImpl implements _TravelAlertModel {
  const _$TravelAlertModelImpl({
    required this.id,
    required this.title,
    required this.severity,
    required this.message,
  });

  factory _$TravelAlertModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelAlertModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String severity;
  // high, medium, low
  @override
  final String message;

  @override
  String toString() {
    return 'TravelAlertModel(id: $id, title: $title, severity: $severity, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelAlertModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, severity, message);

  /// Create a copy of TravelAlertModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelAlertModelImplCopyWith<_$TravelAlertModelImpl> get copyWith =>
      __$$TravelAlertModelImplCopyWithImpl<_$TravelAlertModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelAlertModelImplToJson(this);
  }
}

abstract class _TravelAlertModel implements TravelAlertModel {
  const factory _TravelAlertModel({
    required final String id,
    required final String title,
    required final String severity,
    required final String message,
  }) = _$TravelAlertModelImpl;

  factory _TravelAlertModel.fromJson(Map<String, dynamic> json) =
      _$TravelAlertModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get severity; // high, medium, low
  @override
  String get message;

  /// Create a copy of TravelAlertModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelAlertModelImplCopyWith<_$TravelAlertModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
