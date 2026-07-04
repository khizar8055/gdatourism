// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStateImpl _$$HomeStateImplFromJson(
  Map<String, dynamic> json,
) => _$HomeStateImpl(
  isLoading: json['isLoading'] as bool? ?? false,
  selectedRegion: json['selectedRegion'] == null
      ? null
      : RegionModel.fromJson(json['selectedRegion'] as Map<String, dynamic>),
  currentWeather: json['currentWeather'] == null
      ? null
      : WeatherModel.fromJson(json['currentWeather'] as Map<String, dynamic>),
  travelAlerts:
      (json['travelAlerts'] as List<dynamic>?)
          ?.map((e) => TravelAlertModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  featuredRegions:
      (json['featuredRegions'] as List<dynamic>?)
          ?.map((e) => RegionModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  attractions:
      (json['attractions'] as List<dynamic>?)
          ?.map((e) => AttractionModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  quickActions:
      (json['quickActions'] as List<dynamic>?)
          ?.map((e) => QuickActionModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'selectedRegion': instance.selectedRegion,
      'currentWeather': instance.currentWeather,
      'travelAlerts': instance.travelAlerts,
      'featuredRegions': instance.featuredRegions,
      'attractions': instance.attractions,
      'quickActions': instance.quickActions,
      'errorMessage': instance.errorMessage,
    };
