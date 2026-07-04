import '../../data/models/region_model.dart';
import '../../data/models/weather_model.dart';
import '../../data/models/attraction_model.dart';
import '../../data/models/travel_alert_model.dart';
import '../../data/models/quick_action_model.dart';

abstract class HomeRepositoryInterface {
  Future<List<RegionModel>> getFeaturedRegions();
  Future<WeatherModel> getCurrentWeather(String regionName);
  Future<List<TravelAlertModel>> getTravelAlerts();
  Future<List<AttractionModel>> getAttractions();
  Future<List<QuickActionModel>> getQuickActions();
}
