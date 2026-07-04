// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petrol_pump_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetrolPumpModelImpl _$$PetrolPumpModelImplFromJson(
  Map<String, dynamic> json,
) => _$PetrolPumpModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  regionId: json['regionId'] as String,
  address: json['address'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  contactNumber: json['contactNumber'] as String,
  ownerName: json['ownerName'] as String,
  status: json['status'] as String? ?? 'pending',
  imageUrl: json['imageUrl'] as String? ?? '',
  fuelTypes:
      (json['fuelTypes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  hasATM: json['hasATM'] as bool? ?? false,
  hasShop: json['hasShop'] as bool? ?? false,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  approvedAt: json['approvedAt'] == null
      ? null
      : DateTime.parse(json['approvedAt'] as String),
);

Map<String, dynamic> _$$PetrolPumpModelImplToJson(
  _$PetrolPumpModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'regionId': instance.regionId,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'contactNumber': instance.contactNumber,
  'ownerName': instance.ownerName,
  'status': instance.status,
  'imageUrl': instance.imageUrl,
  'fuelTypes': instance.fuelTypes,
  'hasATM': instance.hasATM,
  'hasShop': instance.hasShop,
  'createdAt': instance.createdAt?.toIso8601String(),
  'approvedAt': instance.approvedAt?.toIso8601String(),
};
