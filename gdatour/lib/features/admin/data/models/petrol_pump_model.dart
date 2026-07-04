import 'package:freezed_annotation/freezed_annotation.dart';

part 'petrol_pump_model.freezed.dart';
part 'petrol_pump_model.g.dart';

@freezed
class PetrolPumpModel with _$PetrolPumpModel {
  const factory PetrolPumpModel({
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
    @Default([]) List<String> fuelTypes, // petrol, diesel, cng
    @Default(false) bool hasATM,
    @Default(false) bool hasShop,
    DateTime? createdAt,
    DateTime? approvedAt,
  }) = _PetrolPumpModel;

  factory PetrolPumpModel.fromJson(Map<String, dynamic> json) =>
      _$PetrolPumpModelFromJson(json);
}
