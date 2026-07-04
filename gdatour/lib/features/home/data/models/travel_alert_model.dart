import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_alert_model.freezed.dart';
part 'travel_alert_model.g.dart';

@freezed
class TravelAlertModel with _$TravelAlertModel {
  const factory TravelAlertModel({
    required String id,
    required String title,
    required String severity, // high, medium, low
    required String message,
  }) = _TravelAlertModel;

  factory TravelAlertModel.fromJson(Map<String, dynamic> json) =>
      _$TravelAlertModelFromJson(json);
}
