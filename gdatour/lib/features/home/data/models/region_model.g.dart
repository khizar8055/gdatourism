// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegionModelImpl _$$RegionModelImplFromJson(Map<String, dynamic> json) =>
    _$RegionModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      shortDescription: json['shortDescription'] as String,
      imageUrl: json['imageUrl'] as String,
      viewpoints:
          (json['viewpoints'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      hotels:
          (json['hotels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RegionModelImplToJson(_$RegionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'imageUrl': instance.imageUrl,
      'viewpoints': instance.viewpoints,
      'hotels': instance.hotels,
    };
