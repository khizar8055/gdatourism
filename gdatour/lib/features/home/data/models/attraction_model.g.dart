// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attraction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttractionModelImpl _$$AttractionModelImplFromJson(
  Map<String, dynamic> json,
) => _$AttractionModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String,
  rating: (json['rating'] as num).toDouble(),
  distance: json['distance'] as String,
);

Map<String, dynamic> _$$AttractionModelImplToJson(
  _$AttractionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'imageUrl': instance.imageUrl,
  'rating': instance.rating,
  'distance': instance.distance,
};
