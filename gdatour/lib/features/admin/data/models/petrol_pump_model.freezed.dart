// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petrol_pump_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PetrolPumpModel _$PetrolPumpModelFromJson(Map<String, dynamic> json) {
  return _PetrolPumpModel.fromJson(json);
}

/// @nodoc
mixin _$PetrolPumpModel {
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
  List<String> get fuelTypes =>
      throw _privateConstructorUsedError; // petrol, diesel, cng
  bool get hasATM => throw _privateConstructorUsedError;
  bool get hasShop => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;

  /// Serializes this PetrolPumpModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PetrolPumpModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PetrolPumpModelCopyWith<PetrolPumpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetrolPumpModelCopyWith<$Res> {
  factory $PetrolPumpModelCopyWith(
    PetrolPumpModel value,
    $Res Function(PetrolPumpModel) then,
  ) = _$PetrolPumpModelCopyWithImpl<$Res, PetrolPumpModel>;
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
    List<String> fuelTypes,
    bool hasATM,
    bool hasShop,
    DateTime? createdAt,
    DateTime? approvedAt,
  });
}

/// @nodoc
class _$PetrolPumpModelCopyWithImpl<$Res, $Val extends PetrolPumpModel>
    implements $PetrolPumpModelCopyWith<$Res> {
  _$PetrolPumpModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PetrolPumpModel
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
    Object? fuelTypes = null,
    Object? hasATM = null,
    Object? hasShop = null,
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
            fuelTypes: null == fuelTypes
                ? _value.fuelTypes
                : fuelTypes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            hasATM: null == hasATM
                ? _value.hasATM
                : hasATM // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasShop: null == hasShop
                ? _value.hasShop
                : hasShop // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PetrolPumpModelImplCopyWith<$Res>
    implements $PetrolPumpModelCopyWith<$Res> {
  factory _$$PetrolPumpModelImplCopyWith(
    _$PetrolPumpModelImpl value,
    $Res Function(_$PetrolPumpModelImpl) then,
  ) = __$$PetrolPumpModelImplCopyWithImpl<$Res>;
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
    List<String> fuelTypes,
    bool hasATM,
    bool hasShop,
    DateTime? createdAt,
    DateTime? approvedAt,
  });
}

/// @nodoc
class __$$PetrolPumpModelImplCopyWithImpl<$Res>
    extends _$PetrolPumpModelCopyWithImpl<$Res, _$PetrolPumpModelImpl>
    implements _$$PetrolPumpModelImplCopyWith<$Res> {
  __$$PetrolPumpModelImplCopyWithImpl(
    _$PetrolPumpModelImpl _value,
    $Res Function(_$PetrolPumpModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PetrolPumpModel
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
    Object? fuelTypes = null,
    Object? hasATM = null,
    Object? hasShop = null,
    Object? createdAt = freezed,
    Object? approvedAt = freezed,
  }) {
    return _then(
      _$PetrolPumpModelImpl(
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
        fuelTypes: null == fuelTypes
            ? _value._fuelTypes
            : fuelTypes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        hasATM: null == hasATM
            ? _value.hasATM
            : hasATM // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasShop: null == hasShop
            ? _value.hasShop
            : hasShop // ignore: cast_nullable_to_non_nullable
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
class _$PetrolPumpModelImpl implements _PetrolPumpModel {
  const _$PetrolPumpModelImpl({
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
    final List<String> fuelTypes = const [],
    this.hasATM = false,
    this.hasShop = false,
    this.createdAt,
    this.approvedAt,
  }) : _fuelTypes = fuelTypes;

  factory _$PetrolPumpModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetrolPumpModelImplFromJson(json);

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
  final List<String> _fuelTypes;
  @override
  @JsonKey()
  List<String> get fuelTypes {
    if (_fuelTypes is EqualUnmodifiableListView) return _fuelTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fuelTypes);
  }

  // petrol, diesel, cng
  @override
  @JsonKey()
  final bool hasATM;
  @override
  @JsonKey()
  final bool hasShop;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? approvedAt;

  @override
  String toString() {
    return 'PetrolPumpModel(id: $id, name: $name, description: $description, regionId: $regionId, address: $address, latitude: $latitude, longitude: $longitude, contactNumber: $contactNumber, ownerName: $ownerName, status: $status, imageUrl: $imageUrl, fuelTypes: $fuelTypes, hasATM: $hasATM, hasShop: $hasShop, createdAt: $createdAt, approvedAt: $approvedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetrolPumpModelImpl &&
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
              other._fuelTypes,
              _fuelTypes,
            ) &&
            (identical(other.hasATM, hasATM) || other.hasATM == hasATM) &&
            (identical(other.hasShop, hasShop) || other.hasShop == hasShop) &&
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
    const DeepCollectionEquality().hash(_fuelTypes),
    hasATM,
    hasShop,
    createdAt,
    approvedAt,
  );

  /// Create a copy of PetrolPumpModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PetrolPumpModelImplCopyWith<_$PetrolPumpModelImpl> get copyWith =>
      __$$PetrolPumpModelImplCopyWithImpl<_$PetrolPumpModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PetrolPumpModelImplToJson(this);
  }
}

abstract class _PetrolPumpModel implements PetrolPumpModel {
  const factory _PetrolPumpModel({
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
    final List<String> fuelTypes,
    final bool hasATM,
    final bool hasShop,
    final DateTime? createdAt,
    final DateTime? approvedAt,
  }) = _$PetrolPumpModelImpl;

  factory _PetrolPumpModel.fromJson(Map<String, dynamic> json) =
      _$PetrolPumpModelImpl.fromJson;

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
  List<String> get fuelTypes; // petrol, diesel, cng
  @override
  bool get hasATM;
  @override
  bool get hasShop;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get approvedAt;

  /// Create a copy of PetrolPumpModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PetrolPumpModelImplCopyWith<_$PetrolPumpModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
