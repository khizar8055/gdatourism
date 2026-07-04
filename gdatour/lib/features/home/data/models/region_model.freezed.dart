// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) {
  return _RegionModel.fromJson(json);
}

/// @nodoc
mixin _$RegionModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get shortDescription => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<String> get viewpoints => throw _privateConstructorUsedError;
  List<String> get hotels => throw _privateConstructorUsedError;

  /// Serializes this RegionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegionModelCopyWith<RegionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionModelCopyWith<$Res> {
  factory $RegionModelCopyWith(
    RegionModel value,
    $Res Function(RegionModel) then,
  ) = _$RegionModelCopyWithImpl<$Res, RegionModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String shortDescription,
    String imageUrl,
    List<String> viewpoints,
    List<String> hotels,
  });
}

/// @nodoc
class _$RegionModelCopyWithImpl<$Res, $Val extends RegionModel>
    implements $RegionModelCopyWith<$Res> {
  _$RegionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortDescription = null,
    Object? imageUrl = null,
    Object? viewpoints = null,
    Object? hotels = null,
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
            shortDescription: null == shortDescription
                ? _value.shortDescription
                : shortDescription // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            viewpoints: null == viewpoints
                ? _value.viewpoints
                : viewpoints // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            hotels: null == hotels
                ? _value.hotels
                : hotels // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegionModelImplCopyWith<$Res>
    implements $RegionModelCopyWith<$Res> {
  factory _$$RegionModelImplCopyWith(
    _$RegionModelImpl value,
    $Res Function(_$RegionModelImpl) then,
  ) = __$$RegionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String shortDescription,
    String imageUrl,
    List<String> viewpoints,
    List<String> hotels,
  });
}

/// @nodoc
class __$$RegionModelImplCopyWithImpl<$Res>
    extends _$RegionModelCopyWithImpl<$Res, _$RegionModelImpl>
    implements _$$RegionModelImplCopyWith<$Res> {
  __$$RegionModelImplCopyWithImpl(
    _$RegionModelImpl _value,
    $Res Function(_$RegionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortDescription = null,
    Object? imageUrl = null,
    Object? viewpoints = null,
    Object? hotels = null,
  }) {
    return _then(
      _$RegionModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        shortDescription: null == shortDescription
            ? _value.shortDescription
            : shortDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        viewpoints: null == viewpoints
            ? _value._viewpoints
            : viewpoints // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        hotels: null == hotels
            ? _value._hotels
            : hotels // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionModelImpl implements _RegionModel {
  const _$RegionModelImpl({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.imageUrl,
    final List<String> viewpoints = const [],
    final List<String> hotels = const [],
  }) : _viewpoints = viewpoints,
       _hotels = hotels;

  factory _$RegionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String shortDescription;
  @override
  final String imageUrl;
  final List<String> _viewpoints;
  @override
  @JsonKey()
  List<String> get viewpoints {
    if (_viewpoints is EqualUnmodifiableListView) return _viewpoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewpoints);
  }

  final List<String> _hotels;
  @override
  @JsonKey()
  List<String> get hotels {
    if (_hotels is EqualUnmodifiableListView) return _hotels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hotels);
  }

  @override
  String toString() {
    return 'RegionModel(id: $id, name: $name, shortDescription: $shortDescription, imageUrl: $imageUrl, viewpoints: $viewpoints, hotels: $hotels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(
              other._viewpoints,
              _viewpoints,
            ) &&
            const DeepCollectionEquality().equals(other._hotels, _hotels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    shortDescription,
    imageUrl,
    const DeepCollectionEquality().hash(_viewpoints),
    const DeepCollectionEquality().hash(_hotels),
  );

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionModelImplCopyWith<_$RegionModelImpl> get copyWith =>
      __$$RegionModelImplCopyWithImpl<_$RegionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionModelImplToJson(this);
  }
}

abstract class _RegionModel implements RegionModel {
  const factory _RegionModel({
    required final String id,
    required final String name,
    required final String shortDescription,
    required final String imageUrl,
    final List<String> viewpoints,
    final List<String> hotels,
  }) = _$RegionModelImpl;

  factory _RegionModel.fromJson(Map<String, dynamic> json) =
      _$RegionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get shortDescription;
  @override
  String get imageUrl;
  @override
  List<String> get viewpoints;
  @override
  List<String> get hotels;

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionModelImplCopyWith<_$RegionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
