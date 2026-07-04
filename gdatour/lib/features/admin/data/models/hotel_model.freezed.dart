// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HotelModel _$HotelModelFromJson(Map<String, dynamic> json) {
  return _HotelModel.fromJson(json);
}

/// @nodoc
mixin _$HotelModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get regionId => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get contactNumber => throw _privateConstructorUsedError;
  String get ownerName => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // pending, approved, rejected
  String get imageUrl => throw _privateConstructorUsedError;
  List<String> get amenities => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  int get priceRange => throw _privateConstructorUsedError; // 1-5 scale
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;

  /// Serializes this HotelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HotelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HotelModelCopyWith<HotelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelModelCopyWith<$Res> {
  factory $HotelModelCopyWith(
    HotelModel value,
    $Res Function(HotelModel) then,
  ) = _$HotelModelCopyWithImpl<$Res, HotelModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String regionId,
    String address,
    double latitude,
    double longitude,
    String contactNumber,
    String ownerName,
    String status,
    String imageUrl,
    List<String> amenities,
    int rating,
    int priceRange,
    DateTime? createdAt,
    DateTime? approvedAt,
  });
}

/// @nodoc
class _$HotelModelCopyWithImpl<$Res, $Val extends HotelModel>
    implements $HotelModelCopyWith<$Res> {
  _$HotelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HotelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? regionId = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? contactNumber = null,
    Object? ownerName = null,
    Object? status = null,
    Object? imageUrl = null,
    Object? amenities = null,
    Object? rating = null,
    Object? priceRange = null,
    Object? createdAt = freezed,
    Object? approvedAt = freezed,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            regionId: null == regionId
                ? _value.regionId
                : regionId // ignore: cast_nullable_to_non_nullable
                      as String,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            contactNumber: null == contactNumber
                ? _value.contactNumber
                : contactNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            ownerName: null == ownerName
                ? _value.ownerName
                : ownerName // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            amenities: null == amenities
                ? _value.amenities
                : amenities // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as int,
            priceRange: null == priceRange
                ? _value.priceRange
                : priceRange // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            approvedAt: freezed == approvedAt
                ? _value.approvedAt
                : approvedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HotelModelImplCopyWith<$Res>
    implements $HotelModelCopyWith<$Res> {
  factory _$$HotelModelImplCopyWith(
    _$HotelModelImpl value,
    $Res Function(_$HotelModelImpl) then,
  ) = __$$HotelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String regionId,
    String address,
    double latitude,
    double longitude,
    String contactNumber,
    String ownerName,
    String status,
    String imageUrl,
    List<String> amenities,
    int rating,
    int priceRange,
    DateTime? createdAt,
    DateTime? approvedAt,
  });
}

/// @nodoc
class __$$HotelModelImplCopyWithImpl<$Res>
    extends _$HotelModelCopyWithImpl<$Res, _$HotelModelImpl>
    implements _$$HotelModelImplCopyWith<$Res> {
  __$$HotelModelImplCopyWithImpl(
    _$HotelModelImpl _value,
    $Res Function(_$HotelModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HotelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? regionId = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? contactNumber = null,
    Object? ownerName = null,
    Object? status = null,
    Object? imageUrl = null,
    Object? amenities = null,
    Object? rating = null,
    Object? priceRange = null,
    Object? createdAt = freezed,
    Object? approvedAt = freezed,
  }) {
    return _then(
      _$HotelModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        regionId: null == regionId
            ? _value.regionId
            : regionId // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        contactNumber: null == contactNumber
            ? _value.contactNumber
            : contactNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        ownerName: null == ownerName
            ? _value.ownerName
            : ownerName // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        amenities: null == amenities
            ? _value._amenities
            : amenities // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as int,
        priceRange: null == priceRange
            ? _value.priceRange
            : priceRange // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        approvedAt: freezed == approvedAt
            ? _value.approvedAt
            : approvedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HotelModelImpl implements _HotelModel {
  const _$HotelModelImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.regionId,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.contactNumber,
    required this.ownerName,
    this.status = 'pending',
    this.imageUrl = '',
    final List<String> amenities = const [],
    this.rating = 0,
    this.priceRange = 0,
    this.createdAt,
    this.approvedAt,
  }) : _amenities = amenities;

  factory _$HotelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotelModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String regionId;
  @override
  final String address;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String contactNumber;
  @override
  final String ownerName;
  @override
  @JsonKey()
  final String status;
  // pending, approved, rejected
  @override
  @JsonKey()
  final String imageUrl;
  final List<String> _amenities;
  @override
  @JsonKey()
  List<String> get amenities {
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amenities);
  }

  @override
  @JsonKey()
  final int rating;
  @override
  @JsonKey()
  final int priceRange;
  // 1-5 scale
  @override
  final DateTime? createdAt;
  @override
  final DateTime? approvedAt;

  @override
  String toString() {
    return 'HotelModel(id: $id, name: $name, description: $description, regionId: $regionId, address: $address, latitude: $latitude, longitude: $longitude, contactNumber: $contactNumber, ownerName: $ownerName, status: $status, imageUrl: $imageUrl, amenities: $amenities, rating: $rating, priceRange: $priceRange, createdAt: $createdAt, approvedAt: $approvedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(
              other._amenities,
              _amenities,
            ) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    regionId,
    address,
    latitude,
    longitude,
    contactNumber,
    ownerName,
    status,
    imageUrl,
    const DeepCollectionEquality().hash(_amenities),
    rating,
    priceRange,
    createdAt,
    approvedAt,
  );

  /// Create a copy of HotelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelModelImplCopyWith<_$HotelModelImpl> get copyWith =>
      __$$HotelModelImplCopyWithImpl<_$HotelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HotelModelImplToJson(this);
  }
}

abstract class _HotelModel implements HotelModel {
  const factory _HotelModel({
    required final String id,
    required final String name,
    required final String description,
    required final String regionId,
    required final String address,
    required final double latitude,
    required final double longitude,
    required final String contactNumber,
    required final String ownerName,
    final String status,
    final String imageUrl,
    final List<String> amenities,
    final int rating,
    final int priceRange,
    final DateTime? createdAt,
    final DateTime? approvedAt,
  }) = _$HotelModelImpl;

  factory _HotelModel.fromJson(Map<String, dynamic> json) =
      _$HotelModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get regionId;
  @override
  String get address;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get contactNumber;
  @override
  String get ownerName;
  @override
  String get status; // pending, approved, rejected
  @override
  String get imageUrl;
  @override
  List<String> get amenities;
  @override
  int get rating;
  @override
  int get priceRange; // 1-5 scale
  @override
  DateTime? get createdAt;
  @override
  DateTime? get approvedAt;

  /// Create a copy of HotelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HotelModelImplCopyWith<_$HotelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
