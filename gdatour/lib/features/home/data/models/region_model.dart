import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_model.freezed.dart';
part 'region_model.g.dart';

@freezed
class RegionModel with _$RegionModel {
  const factory RegionModel({
    required String id,
    required String name,
    required String shortDescription,
    required String imageUrl,
    @Default([]) List<String> viewpoints,
    @Default([]) List<String> hotels,
  }) = _RegionModel;

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);
}
