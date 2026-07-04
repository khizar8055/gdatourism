import 'package:freezed_annotation/freezed_annotation.dart';

part 'attraction_model.freezed.dart';
part 'attraction_model.g.dart';

@freezed
class AttractionModel with _$AttractionModel {
  const factory AttractionModel({
    required String id,
    required String name,
    required String imageUrl,
    required double rating,
    required String distance,
  }) = _AttractionModel;

  factory AttractionModel.fromJson(Map<String, dynamic> json) =>
      _$AttractionModelFromJson(json);
}
