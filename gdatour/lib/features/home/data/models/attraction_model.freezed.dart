// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attraction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AttractionModel _$AttractionModelFromJson(Map<String, dynamic> json) {
  return _AttractionModel.fromJson(json);
}

/// @nodoc
mixin _$AttractionModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get distance => throw _privateConstructorUsedError;

  /// Serializes this AttractionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttractionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttractionModelCopyWith<AttractionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttractionModelCopyWith<$Res> {
  factory $AttractionModelCopyWith(
    AttractionModel value,
    $Res Function(AttractionModel) then,
  ) = _$AttractionModelCopyWithImpl<$Res, AttractionModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String imageUrl,
    double rating,
    String distance,
  });
}

/// @nodoc
class _$AttractionModelCopyWithImpl<$Res, $Val extends AttractionModel>
    implements $AttractionModelCopyWith<$Res> {
  _$AttractionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttractionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? rating = null,
    Object? distance = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            distance: null == distance
                ? _value.distance
                : distance // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AttractionModelImplCopyWith<$Res>
    implements $AttractionModelCopyWith<$Res> {
  factory _$$AttractionModelImplCopyWith(
    _$AttractionModelImpl value,
    $Res Function(_$AttractionModelImpl) then,
  ) = __$$AttractionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String imageUrl,
    double rating,
    String distance,
  });
}

/// @nodoc
class __$$AttractionModelImplCopyWithImpl<$Res>
    extends _$AttractionModelCopyWithImpl<$Res, _$AttractionModelImpl>
    implements _$$AttractionModelImplCopyWith<$Res> {
  __$$AttractionModelImplCopyWithImpl(
    _$AttractionModelImpl _value,
    $Res Function(_$AttractionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AttractionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? rating = null,
    Object? distance = null,
  }) {
    return _then(
      _$AttractionModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        distance: null == distance
            ? _value.distance
            : distance // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AttractionModelImpl implements _AttractionModel {
  const _$AttractionModelImpl({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.distance,
  });

  factory _$AttractionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttractionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final double rating;
  @override
  final String distance;

  @override
  String toString() {
    return 'AttractionModel(id: $id, name: $name, imageUrl: $imageUrl, rating: $rating, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttractionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, imageUrl, rating, distance);

  /// Create a copy of AttractionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttractionModelImplCopyWith<_$AttractionModelImpl> get copyWith =>
      __$$AttractionModelImplCopyWithImpl<_$AttractionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AttractionModelImplToJson(this);
  }
}

abstract class _AttractionModel implements AttractionModel {
  const factory _AttractionModel({
    required final String id,
    required final String name,
    required final String imageUrl,
    required final double rating,
    required final String distance,
  }) = _$AttractionModelImpl;

  factory _AttractionModel.fromJson(Map<String, dynamic> json) =
      _$AttractionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  double get rating;
  @override
  String get distance;

  /// Create a copy of AttractionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttractionModelImplCopyWith<_$AttractionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
