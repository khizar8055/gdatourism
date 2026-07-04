import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/region_model.dart';
import '../../data/models/weather_model.dart';
import '../../data/models/attraction_model.dart';
import '../../data/models/travel_alert_model.dart';
import '../../data/models/quick_action_model.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    RegionModel? selectedRegion,
    WeatherModel? currentWeather,
    @Default([]) List<TravelAlertModel> travelAlerts,
    @Default([]) List<RegionModel> featuredRegions,
    @Default([]) List<AttractionModel> attractions,
    @Default([]) List<QuickActionModel> quickActions,
    String? errorMessage,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
