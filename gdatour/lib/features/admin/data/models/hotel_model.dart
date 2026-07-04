import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel_model.freezed.dart';
part 'hotel_model.g.dart';

@freezed
class HotelModel with _$HotelModel {
  const factory HotelModel({
    required String id,
    required String name,
    required String description,
    required String regionId,
    required String address,
    required double latitude,
    required double longitude,
    required String contactNumber,
    required String ownerName,
    @Default('pending') String status, // pending, approved, rejected
    @Default('') String imageUrl,
    @Default([]) List<String> amenities,
    @Default(0) int rating,
    @Default(0) int priceRange, // 1-5 scale
    DateTime? createdAt,
    DateTime? approvedAt,
  }) = _HotelModel;

  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      _$HotelModelFromJson(json);
}
