// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_alert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TravelAlertModelImpl _$$TravelAlertModelImplFromJson(
  Map<String, dynamic> json,
) => _$TravelAlertModelImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  severity: json['severity'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$$TravelAlertModelImplToJson(
  _$TravelAlertModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'severity': instance.severity,
  'message': instance.message,
};
