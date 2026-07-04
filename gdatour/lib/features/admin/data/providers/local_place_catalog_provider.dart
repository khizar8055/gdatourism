import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/hospital_model.dart';
import '../models/hotel_model.dart';
import '../models/petrol_pump_model.dart';

class LocalPlaceCatalogState {
  final List<HotelModel> hotels;
  final List<HospitalModel> hospitals;
  final List<PetrolPumpModel> petrolPumps;

  const LocalPlaceCatalogState({
    this.hotels = const [],
    this.hospitals = const [],
    this.petrolPumps = const [],
  });

  LocalPlaceCatalogState copyWith({
    List<HotelModel>? hotels,
    List<HospitalModel>? hospitals,
    List<PetrolPumpModel>? petrolPumps,
  }) {
    return LocalPlaceCatalogState(
      hotels: hotels ?? this.hotels,
      hospitals: hospitals ?? this.hospitals,
      petrolPumps: petrolPumps ?? this.petrolPumps,
    );
  }
}

class LocalPlaceCatalogNotifier extends StateNotifier<LocalPlaceCatalogState> {
  static const String _storageKey = 'local_place_catalog_v1';

  LocalPlaceCatalogNotifier() : super(const LocalPlaceCatalogState());

  Future<void> loadFromDisk() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw == null || raw.isEmpty) return;

    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      state = LocalPlaceCatalogState(
        hotels: (decoded['hotels'] as List<dynamic>?)
                ?.map((item) => HotelModel.fromJson(item as Map<String, dynamic>))
                .toList() ??
            const [],
        hospitals: (decoded['hospitals'] as List<dynamic>?)
                ?.map((item) => HospitalModel.fromJson(item as Map<String, dynamic>))
                .toList() ??
            const [],
        petrolPumps: (decoded['petrolPumps'] as List<dynamic>?)
                ?.map((item) => PetrolPumpModel.fromJson(item as Map<String, dynamic>))
                .toList() ??
            const [],
      );
    } catch (_) {
      state = const LocalPlaceCatalogState();
    }
  }

  Future<void> _saveToDisk() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode({
      'hotels': state.hotels.map((hotel) => hotel.toJson()).toList(),
      'hospitals': state.hospitals.map((hospital) => hospital.toJson()).toList(),
      'petrolPumps': state.petrolPumps.map((pump) => pump.toJson()).toList(),
    });
    await prefs.setString(_storageKey, encoded);
  }

  Future<void> addHotel(HotelModel hotel) async {
    state = state.copyWith(hotels: [...state.hotels, hotel]);
    await _saveToDisk();
  }

  Future<void> addHospital(HospitalModel hospital) async {
    state = state.copyWith(hospitals: [...state.hospitals, hospital]);
    await _saveToDisk();
  }

  Future<void> addPetrolPump(PetrolPumpModel petrolPump) async {
    state = state.copyWith(petrolPumps: [...state.petrolPumps, petrolPump]);
    await _saveToDisk();
  }

  Future<void> updateHotel(HotelModel hotel) async {
    state = state.copyWith(
      hotels: state.hotels
          .map((h) => h.id == hotel.id ? hotel : h)
          .toList(),
    );
    await _saveToDisk();
  }

  Future<void> updateHospital(HospitalModel hospital) async {
    state = state.copyWith(
      hospitals: state.hospitals
          .map((h) => h.id == hospital.id ? hospital : h)
          .toList(),
    );
    await _saveToDisk();
  }

  Future<void> updatePetrolPump(PetrolPumpModel petrolPump) async {
    state = state.copyWith(
      petrolPumps: state.petrolPumps
          .map((p) => p.id == petrolPump.id ? petrolPump : p)
          .toList(),
    );
    await _saveToDisk();
  }

  Future<void> deleteHotel(String id) async {
    state = state.copyWith(
      hotels: state.hotels.where((h) => h.id != id).toList(),
    );
    await _saveToDisk();
  }

  Future<void> deleteHospital(String id) async {
    state = state.copyWith(
      hospitals: state.hospitals.where((h) => h.id != id).toList(),
    );
    await _saveToDisk();
  }

  Future<void> deletePetrolPump(String id) async {
    state = state.copyWith(
      petrolPumps: state.petrolPumps.where((p) => p.id != id).toList(),
    );
    await _saveToDisk();
  }
}

final localPlaceCatalogProvider =
    StateNotifierProvider<LocalPlaceCatalogNotifier, LocalPlaceCatalogState>((ref) {
  final notifier = LocalPlaceCatalogNotifier();
  Future.microtask(notifier.loadFromDisk);
  return notifier;
});