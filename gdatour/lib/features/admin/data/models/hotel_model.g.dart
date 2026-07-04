// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HotelModelImpl _$$HotelModelImplFromJson(Map<String, dynamic> json) =>
    _$HotelModelImpl(
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
      amenities:
          (json['amenities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      priceRange: (json['priceRange'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
    );

Map<String, dynamic> _$$HotelModelImplToJson(_$HotelModelImpl instance) =>
    <String, dynamic>{
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
      'amenities': instance.amenities,
      'rating': instance.rating,
      'priceRange': instance.priceRange,
      'createdAt': instance.createdAt?.toIso8601String(),
      'approvedAt': instance.approvedAt?.toIso8601String(),
    };
