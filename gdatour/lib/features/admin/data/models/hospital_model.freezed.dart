// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hospital_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HospitalModel _$HospitalModelFromJson(Map<String, dynamic> json) {
  return _HospitalModel.fromJson(json);
}

/// @nodoc
mixin _$HospitalModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get regionId => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get contactNumber => throw _privateConstructorUsedError;
  String get adminName => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // pending, approved, rejected
  String get imageUrl => throw _privateConstructorUsedError;
  List<String> get facilities =>
      throw _privateConstructorUsedError; // emergency, pharmacy, lab, xray
  bool get hasEmergency247 => throw _privateConstructorUsedError;
  bool get hasAmbulance => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;

  /// Serializes this HospitalModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HospitalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HospitalModelCopyWith<HospitalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalModelCopyWith<$Res> {
  factory $HospitalModelCopyWith(
    HospitalModel value,
    $Res Function(HospitalModel) then,
  ) = _$HospitalModelCopyWithImpl<$Res, HospitalModel>;
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
    String adminName,
    String status,
    String imageUrl,
    List<String> facilities,
    bool hasEmergency247,
    bool hasAmbulance,
    DateTime? createdAt,
    DateTime? approvedAt,
  });
}

/// @nodoc
class _$HospitalModelCopyWithImpl<$Res, $Val extends HospitalModel>
    implements $HospitalModelCopyWith<$Res> {
  _$HospitalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HospitalModel
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
    Object? adminName = null,
    Object? status = null,
    Object? imageUrl = null,
    Object? facilities = null,
    Object? hasEmergency247 = null,
    Object? hasAmbulance = null,
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
            adminName: null == adminName
                ? _value.adminName
                : adminName // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            facilities: null == facilities
                ? _value.facilities
                : facilities // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            hasEmergency247: null == hasEmergency247
                ? _value.hasEmergency247
                : hasEmergency247 // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasAmbulance: null == hasAmbulance
                ? _value.hasAmbulance
                : hasAmbulance // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$HospitalModelImplCopyWith<$Res>
    implements $HospitalModelCopyWith<$Res> {
  factory _$$HospitalModelImplCopyWith(
    _$HospitalModelImpl value,
    $Res Function(_$HospitalModelImpl) then,
  ) = __$$HospitalModelImplCopyWithImpl<$Res>;
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
    String adminName,
    String status,
    String imageUrl,
    List<String> facilities,
    bool hasEmergency247,
    bool hasAmbulance,
    DateTime? createdAt,
    DateTime? approvedAt,
  });
}

/// @nodoc
class __$$HospitalModelImplCopyWithImpl<$Res>
    extends _$HospitalModelCopyWithImpl<$Res, _$HospitalModelImpl>
    implements _$$HospitalModelImplCopyWith<$Res> {
  __$$HospitalModelImplCopyWithImpl(
    _$HospitalModelImpl _value,
    $Res Function(_$HospitalModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HospitalModel
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
    Object? adminName = null,
    Object? status = null,
    Object? imageUrl = null,
    Object? facilities = null,
    Object? hasEmergency247 = null,
    Object? hasAmbulance = null,
    Object? createdAt = freezed,
    Object? approvedAt = freezed,
  }) {
    return _then(
      _$HospitalModelImpl(
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
        adminName: null == adminName
            ? _value.adminName
            : adminName // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        facilities: null == facilities
            ? _value._facilities
            : facilities // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        hasEmergency247: null == hasEmergency247
            ? _value.hasEmergency247
            : hasEmergency247 // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasAmbulance: null == hasAmbulance
            ? _value.hasAmbulance
            : hasAmbulance // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$HospitalModelImpl implements _HospitalModel {
  const _$HospitalModelImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.regionId,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.contactNumber,
    required this.adminName,
    this.status = 'pending',
    this.imageUrl = '',
    final List<String> facilities = const [],
    this.hasEmergency247 = false,
    this.hasAmbulance = false,
    this.createdAt,
    this.approvedAt,
  }) : _facilities = facilities;

  factory _$HospitalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HospitalModelImplFromJson(json);

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
  final String adminName;
  @override
  @JsonKey()
  final String status;
  // pending, approved, rejected
  @override
  @JsonKey()
  final String imageUrl;
  final List<String> _facilities;
  @override
  @JsonKey()
  List<String> get facilities {
    if (_facilities is EqualUnmodifiableListView) return _facilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilities);
  }

  // emergency, pharmacy, lab, xray
  @override
  @JsonKey()
  final bool hasEmergency247;
  @override
  @JsonKey()
  final bool hasAmbulance;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? approvedAt;

  @override
  String toString() {
    return 'HospitalModel(id: $id, name: $name, description: $description, regionId: $regionId, address: $address, latitude: $latitude, longitude: $longitude, contactNumber: $contactNumber, adminName: $adminName, status: $status, imageUrl: $imageUrl, facilities: $facilities, hasEmergency247: $hasEmergency247, hasAmbulance: $hasAmbulance, createdAt: $createdAt, approvedAt: $approvedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalModelImpl &&
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
            (identical(other.adminName, adminName) ||
                other.adminName == adminName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(
              other._facilities,
              _facilities,
            ) &&
            (identical(other.hasEmergency247, hasEmergency247) ||
                other.hasEmergency247 == hasEmergency247) &&
            (identical(other.hasAmbulance, hasAmbulance) ||
                other.hasAmbulance == hasAmbulance) &&
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
    adminName,
    status,
    imageUrl,
    const DeepCollectionEquality().hash(_facilities),
    hasEmergency247,
    hasAmbulance,
    createdAt,
    approvedAt,
  );

  /// Create a copy of HospitalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HospitalModelImplCopyWith<_$HospitalModelImpl> get copyWith =>
      __$$HospitalModelImplCopyWithImpl<_$HospitalModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HospitalModelImplToJson(this);
  }
}

abstract class _HospitalModel implements HospitalModel {
  const factory _HospitalModel({
    required final String id,
    required final String name,
    required final String description,
    required final String regionId,
    required final String address,
    required final double latitude,
    required final double longitude,
    required final String contactNumber,
    required final String adminName,
    final String status,
    final String imageUrl,
    final List<String> facilities,
    final bool hasEmergency247,
    final bool hasAmbulance,
    final DateTime? createdAt,
    final DateTime? approvedAt,
  }) = _$HospitalModelImpl;

  factory _HospitalModel.fromJson(Map<String, dynamic> json) =
      _$HospitalModelImpl.fromJson;

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
  String get adminName;
  @override
  String get status; // pending, approved, rejected
  @override
  String get imageUrl;
  @override
  List<String> get facilities; // emergency, pharmacy, lab, xray
  @override
  bool get hasEmergency247;
  @override
  bool get hasAmbulance;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get approvedAt;

  /// Create a copy of HospitalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HospitalModelImplCopyWith<_$HospitalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
