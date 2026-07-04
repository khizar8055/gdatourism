import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/home_repository_interface.dart';
import '../../data/models/region_model.dart';
import 'home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeRepositoryInterface _repository;

  HomeNotifier(this._repository) : super(const HomeState()) {
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final regions = await _repository.getFeaturedRegions();
      final alerts = await _repository.getTravelAlerts();
      final attractions = await _repository.getAttractions();
      final quickActions = await _repository.getQuickActions();

      final initialRegion = state.selectedRegion ?? (regions.isNotEmpty ? regions.first : null);
      
      state = state.copyWith(
        featuredRegions: regions,
        travelAlerts: alerts,
        attractions: attractions,
        quickActions: quickActions,
        selectedRegion: initialRegion,
      );

      if (initialRegion != null) {
        await getCurrentWeather(initialRegion.name);
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load tourism data. Please try again.',
      );
    }
  }

  Future<void> refreshData() async {
    await loadHomeData();
  }

  Future<void> selectRegion(RegionModel region) async {
    state = state.copyWith(selectedRegion: region);
    await getCurrentWeather(region.name);
  }

  Future<void> getCurrentWeather(String regionName) async {
    try {
      final weather = await _repository.getCurrentWeather(regionName);
      state = state.copyWith(
        currentWeather: weather,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to update weather details.',
      );
    }
  }

  Future<void> getFeaturedRegions() async {
    try {
      final regions = await _repository.getFeaturedRegions();
      state = state.copyWith(featuredRegions: regions);
    } catch (e) {
      state = state.copyWith(errorMessage: 'Failed to load featured regions.');
    }
  }

  Future<void> getTravelAlerts() async {
    try {
      final alerts = await _repository.getTravelAlerts();
      state = state.copyWith(travelAlerts: alerts);
    } catch (e) {
      state = state.copyWith(errorMessage: 'Failed to load travel alerts.');
    }
  }
}
