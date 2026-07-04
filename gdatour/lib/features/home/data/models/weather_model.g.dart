// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      regionName: json['regionName'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      condition: json['condition'] as String,
      humidity: (json['humidity'] as num).toDouble(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'regionName': instance.regionName,
      'temperature': instance.temperature,
      'condition': instance.condition,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
    };
