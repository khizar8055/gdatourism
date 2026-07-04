// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HospitalModelImpl _$$HospitalModelImplFromJson(Map<String, dynamic> json) =>
    _$HospitalModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      regionId: json['regionId'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      contactNumber: json['contactNumber'] as String,
      adminName: json['adminName'] as String,
      status: json['status'] as String? ?? 'pending',
      imageUrl: json['imageUrl'] as String? ?? '',
      facilities:
          (json['facilities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      hasEmergency247: json['hasEmergency247'] as bool? ?? false,
      hasAmbulance: json['hasAmbulance'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
    );

Map<String, dynamic> _$$HospitalModelImplToJson(_$HospitalModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'regionId': instance.regionId,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'contactNumber': instance.contactNumber,
      'adminName': instance.adminName,
      'status': instance.status,
      'imageUrl': instance.imageUrl,
      'facilities': instance.facilities,
      'hasEmergency247': instance.hasEmergency247,
      'hasAmbulance': instance.hasAmbulance,
      'createdAt': instance.createdAt?.toIso8601String(),
      'approvedAt': instance.approvedAt?.toIso8601String(),
    };
