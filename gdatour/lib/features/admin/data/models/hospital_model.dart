import 'package:freezed_annotation/freezed_annotation.dart';

part 'hospital_model.freezed.dart';
part 'hospital_model.g.dart';

@freezed
class HospitalModel with _$HospitalModel {
  const factory HospitalModel({
    required String id,
    required String name,
    required String description,
    required String regionId,
    required String address,
    required double latitude,
    required double longitude,
    required String contactNumber,
    required String adminName,
    @Default('pending') String status, // pending, approved, rejected
    @Default('') String imageUrl,
    @Default([]) List<String> facilities, // emergency, pharmacy, lab, xray
    @Default(false) bool hasEmergency247,
    @Default(false) bool hasAmbulance,
    DateTime? createdAt,
    DateTime? approvedAt,
  }) = _HospitalModel;

  factory HospitalModel.fromJson(Map<String, dynamic> json) =>
      _$HospitalModelFromJson(json);
}
