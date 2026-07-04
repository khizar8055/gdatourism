import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_action_model.freezed.dart';
part 'quick_action_model.g.dart';

@freezed
class QuickActionModel with _$QuickActionModel {
  const factory QuickActionModel({
    required String id,
    required String title,
    required String iconKey,
    required String route,
  }) = _QuickActionModel;

  factory QuickActionModel.fromJson(Map<String, dynamic> json) =>
      _$QuickActionModelFromJson(json);
}
