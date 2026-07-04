import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import '../../domain/repositories/home_repository_interface.dart';
import '../models/region_model.dart';
import '../models/weather_model.dart';
import '../models/attraction_model.dart';
import '../models/travel_alert_model.dart';
import '../models/quick_action_model.dart';

class HomeRepository implements HomeRepositoryInterface {
  // Simulate network delay
  Future<void> _simulateNetworkDelay() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<List<RegionModel>> getFeaturedRegions() async {
    await _simulateNetworkDelay();
    return const [
      RegionModel(
        id: 'murree',
        name: 'Murree',
        shortDescription: 'The queen of hills, a historic hill station with colonial charm, mall road, and breathtaking views.',
        imageUrl: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=600&auto=format&fit=crop&q=80',
        viewpoints: [
          'Mall Road Murree',
          'Kashmir Point',
          'Pindi Point',
          'GPO Chowk',
          'Lawrence College'
        ],
        hotels: [
          'Pearl Continental Hotel (Luxury)',
          'Flashman\'s Hotel (Historic)',
          'Hotel One Murree',
          'Royalton Hotel'
        ],
      ),
      RegionModel(
        id: 'nathia_gali',
        name: 'Nathia Gali',
        shortDescription: 'Known for its scenic beauty, hiking trails, lush green hills, and cool mist.',
        imageUrl: 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=600&auto=format&fit=crop&q=80',
        viewpoints: [
          'Miranjani Peak (Highest Peak)',
          'Nathia Gali Church (Historic)',
          'Governor House Track',
          'Galiyat Forest Park'
        ],
        hotels: [
          'Elite Hotel (Premium views)',
          'Alpine Hotel & Resort (Luxury comfort)',
          'Summer Retreat Hotel (Cozy alpine suites)',
          'Hotel Cloud 9 (High dining)'
        ],
      ),
      RegionModel(
        id: 'ayubia',
        name: 'Ayubia',
        shortDescription: 'Famous for its National Park, scenic trails, and family-friendly chairlift.',
        imageUrl: 'https://images.unsplash.com/photo-1589979482837-e74f2e145060?w=600&auto=format&fit=crop&q=80',
        viewpoints: [
          'Ayubia Chairlift (Canopy ride)',
          'Ayubia National Park (Pine woodland)',
          'Pipeline Track (Forest walk)',
          'Lalazar Park (Sunset viewpoints)'
        ],
        hotels: [
          'Green Retreat Hotel (Pine campus)',
          'Lalazar Hotel (Sunset heights)',
          'Ayubia Heights (Apartments & luxury dining)'
        ],
      ),
      RegionModel(
        id: 'dunga_gali',
        name: 'Dunga Gali',
        shortDescription: 'A peaceful wooded resort featuring the gateway to the Mushkpuri Peak trek.',
        imageUrl: 'https://images.unsplash.com/photo-1542224566-6e85f2e6772f?w=600&auto=format&fit=crop&q=80',
        viewpoints: [
          'Mushkpuri Peak (Meadow summit)',
          'Dunga Gali Pine Forest',
          'Pipeline Trek Gateway',
          'Mukshpuri Viewpoint'
        ],
        hotels: [
          'Dunga Gali Retreat (Cozy dining)',
          'Hotel Amore Dunga Gali (Italian style)',
          'Pine View Lodge (Affordable forest views)'
        ],
      ),
      RegionModel(
        id: 'changla_gali',
        name: 'Changla Gali',
        shortDescription: 'Highest altitude resort in Galiyat, enveloped in pine forests and floating clouds.',
        imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=600&auto=format&fit=crop&q=80',
        viewpoints: [
          'Changla Peak (Highest viewpoint)',
          'Pines Walkway (Misty path)',
          'Cloud Point (Panoramic views)'
        ],
        hotels: [
          'Changla Gali Pines Hotel (Historic lodge)',
          'Woods Edge Resort (Wood cabins)',
          'Cloud 9 Lodge (Premium view suites)'
        ],
      ),
      RegionModel(
        id: 'thandiani',
        name: 'Thandiani',
        shortDescription: 'A serene and less crowded hill station known for its cool climate and panoramic mountain views.',
        imageUrl: 'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=600&auto=format&fit=crop&q=80',
        viewpoints: [
          'Thandiani Top',
          'Kala Chitta Range View',
          'Pine Forest Walk',
          'Sunset Point'
        ],
        hotels: [
          'Thandiani Rest House',
          'Pine View Hotel Thandiani',
          'Mountain Retreat'
        ],
      ),
      RegionModel(
        id: 'bara_gali',
        name: 'Bara Gali',
        shortDescription: 'A quiet and scenic resort with beautiful pine forests and access to major hiking trails.',
        imageUrl: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=600&auto=format&fit=crop&q=80',
        viewpoints: [
          'Bara Gali Meadows',
          'Forest Trail to Ayubia',
          'Viewpoint of Nanga Parbat'
        ],
        hotels: [
          'Bara Gali Resort',
          'Pine Creek Hotel',
          'Forest View Guest House'
        ],
      ),
      RegionModel(
        id: 'khaira_gali',
        name: 'Khaira Gali',
        shortDescription: 'A charming small town with beautiful pine trees, cool weather, and peaceful environment.',
        imageUrl: 'https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=600&auto=format&fit=crop&q=80',
        viewpoints: [
          'Khaira Gali Park',
          'Pine Tree Walk',
          'Local Bazaar'
        ],
        hotels: [
          'Khaira Gali Hotel',
          'Hill View Guest House',
          'Green Valley Resort'
        ],
      ),
      RegionModel(
        id: 'patriata',
        name: 'Patriata (New Murree)',
        shortDescription: 'Known for its beautiful chairlift and cable car, offering stunning views of the surrounding hills.',
        imageUrl: 'https://images.unsplash.com/photo-1464278533981-50106e6176b1?w=600&auto=format&fit=crop&q=80',
        viewpoints: [
          'Patriata Chairlift',
          'Cable Car Ride',
          'Patriata Park',
          'Viewpoint'
        ],
        hotels: [
          'Patriata View Hotel',
          'Hill Top Resort',
          'Cable View Hotel'
        ],
      ),
      RegionModel(
        id: 'ghora_gali',
        name: 'Ghora Gali',
        shortDescription: 'A historic town known for Lawrence College and beautiful scenic views.',
        imageUrl: 'https://images.unsplash.com/photo-1518173946687-a4c036bc3d6c?w=600&auto=format&fit=crop&q=80',
        viewpoints: [
          'Lawrence College Ghora Gali',
          'Ghora Gali Park',
          'Scenic Viewpoints'
        ],
        hotels: [
          'Ghora Gali Hotel',
          'College View Guest House',
          'Pine Rest Hotel'
        ],
      ),
      RegionModel(
        id: 'jhika_gali',
        name: 'Jhika Gali',
        shortDescription: 'A peaceful and scenic village with beautiful pine forests and hiking trails.',
        imageUrl: 'https://images.unsplash.com/photo-1440342359743-84fcb8c21f21?w=600&auto=format&fit=crop&q=80',
        viewpoints: [
          'Jhika Gali Forest',
          'Hiking Trails',
          'Local Village'
        ],
        hotels: [
          'Jhika Gali Guest House',
          'Forest Retreat',
          'Village View Hotel'
        ],
      ),
      RegionModel(
        id: 'kuldana',
        name: 'Kuldana',
        shortDescription: 'A small scenic village known for its peaceful environment and beautiful views.',
        imageUrl: 'https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=600&auto=format&fit=crop&q=80',
        viewpoints: [
          'Kuldana Viewpoint',
          'Pine Forest',
          'Walking Trails'
        ],
        hotels: [
          'Kuldana Guest House',
          'Hill View Stay',
          'Pine Rest'
        ],
      ),
    ];
  }

  @override
  Future<WeatherModel> getCurrentWeather(String regionName) async {
    final apiKey = dotenv.env['WEATHER_API_KEY'];
    final apiUrl = dotenv.env['WEATHER_API_URL'];

    // If API key is not set, fall back to mock data
    if (apiKey == null || apiKey.isEmpty || apiKey == 'your_openweathermap_api_key_here') {
      return _getMockWeather(regionName);
    }

    try {
      // Coordinates for Galiyat regions (approximate)
      final coordinates = _getRegionCoordinates(regionName);

      final response = await http.get(
        Uri.parse('$apiUrl?lat=${coordinates['lat']}&lon=${coordinates['lon']}&appid=$apiKey&units=metric'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherModel(
          regionName: regionName,
          temperature: data['main']['temp'].toDouble(),
          condition: _mapWeatherCondition(data['weather'][0]['main'], data['weather'][0]['description']),
          humidity: data['main']['humidity'].toDouble(),
          windSpeed: data['wind']['speed'].toDouble(),
        );
      } else {
        // If API fails, fall back to mock data
        return _getMockWeather(regionName);
      }
    } catch (e) {
      // If there's an error, fall back to mock data
      return _getMockWeather(regionName);
    }
  }

  WeatherModel _getMockWeather(String regionName) {
    switch (regionName.toLowerCase()) {
      case 'murree':
        return const WeatherModel(
          regionName: 'Murree',
          temperature: 17.0,
          condition: 'Partly Cloudy',
          humidity: 75.0,
          windSpeed: 10.0,
        );
      case 'ayubia':
        return const WeatherModel(
          regionName: 'Ayubia',
          temperature: 15.0,
          condition: 'Mist',
          humidity: 82.0,
          windSpeed: 8.5,
        );
      case 'dunga gali':
        return const WeatherModel(
          regionName: 'Dunga Gali',
          temperature: 14.5,
          condition: 'Heavy Rain',
          humidity: 90.0,
          windSpeed: 18.0,
        );
      case 'changla gali':
        return const WeatherModel(
          regionName: 'Changla Gali',
          temperature: 13.0,
          condition: 'Foggy',
          humidity: 88.0,
          windSpeed: 10.0,
        );
      case 'thandiani':
        return const WeatherModel(
          regionName: 'Thandiani',
          temperature: 12.0,
          condition: 'Clear',
          humidity: 65.0,
          windSpeed: 7.0,
        );
      case 'bara gali':
        return const WeatherModel(
          regionName: 'Bara Gali',
          temperature: 14.0,
          condition: 'Cloudy',
          humidity: 80.0,
          windSpeed: 9.0,
        );
      case 'khaira gali':
        return const WeatherModel(
          regionName: 'Khaira Gali',
          temperature: 15.5,
          condition: 'Sunny',
          humidity: 70.0,
          windSpeed: 6.0,
        );
      case 'patriata':
      case 'patriata (new murree)':
        return const WeatherModel(
          regionName: 'Patriata (New Murree)',
          temperature: 16.0,
          condition: 'Partly Cloudy',
          humidity: 72.0,
          windSpeed: 8.0,
        );
      case 'ghora gali':
        return const WeatherModel(
          regionName: 'Ghora Gali',
          temperature: 16.5,
          condition: 'Mist',
          humidity: 78.0,
          windSpeed: 11.0,
        );
      case 'jhika gali':
        return const WeatherModel(
          regionName: 'Jhika Gali',
          temperature: 14.5,
          condition: 'Light Rain',
          humidity: 85.0,
          windSpeed: 9.5,
        );
      case 'kuldana':
        return const WeatherModel(
          regionName: 'Kuldana',
          temperature: 13.5,
          condition: 'Foggy',
          humidity: 87.0,
          windSpeed: 10.5,
        );
      case 'nathia gali':
      default:
        return const WeatherModel(
          regionName: 'Nathia Gali',
          temperature: 16.5,
          condition: 'Cloudy',
          humidity: 78.0,
          windSpeed: 12.0,
        );
    }
  }

  Map<String, double> _getRegionCoordinates(String regionName) {
    switch (regionName.toLowerCase()) {
      case 'murree':
        return {'lat': 33.9063, 'lon': 73.3903};
      case 'nathia gali':
        return {'lat': 34.0667, 'lon': 73.3833};
      case 'ayubia':
        return {'lat': 34.0833, 'lon': 73.4167};
      case 'dunga gali':
        return {'lat': 34.0833, 'lon': 73.3667};
      case 'changla gali':
        return {'lat': 34.1000, 'lon': 73.4000};
      case 'thandiani':
        return {'lat': 34.1833, 'lon': 73.3333};
      case 'bara gali':
        return {'lat': 34.0333, 'lon': 73.3833};
      case 'khaira gali':
        return {'lat': 34.0167, 'lon': 73.4000};
      case 'patriata':
      case 'patriata (new murree)':
        return {'lat': 33.8667, 'lon': 73.4333};
      case 'ghora gali':
        return {'lat': 33.9500, 'lon': 73.4167};
      case 'jhika gali':
        return {'lat': 34.0500, 'lon': 73.4167};
      case 'kuldana':
        return {'lat': 34.0833, 'lon': 73.4333};
      default:
        return {'lat': 34.0667, 'lon': 73.3833}; // Default to Nathia Gali
    }
  }

  String _mapWeatherCondition(String mainCondition, String description) {
    final condition = description.toLowerCase();
    if (condition.contains('clear') || condition.contains('sunny')) {
      return 'Sunny';
    } else if (condition.contains('rain') || condition.contains('drizzle')) {
      return 'Rainy';
    } else if (condition.contains('mist') || condition.contains('haze')) {
      return 'Mist';
    } else if (condition.contains('fog')) {
      return 'Foggy';
    } else if (condition.contains('cloud')) {
      return 'Cloudy';
    } else if (condition.contains('snow')) {
      return 'Snowy';
    } else if (condition.contains('thunder')) {
      return 'Thunderstorm';
    } else {
      return mainCondition;
    }
  }

  @override
  Future<List<TravelAlertModel>> getTravelAlerts() async {
    final alertsApiKey = dotenv.env['ALERTS_API_KEY'];
    final alertsApiUrl = dotenv.env['ALERTS_API_URL'];

    // If API key is not set, fall back to mock data
    if (alertsApiKey == null || alertsApiKey.isEmpty || alertsApiKey == 'your_alerts_api_key_here') {
      return _getMockAlerts();
    }

    try {
      final response = await http.get(
        Uri.parse('$alertsApiUrl?api_key=$alertsApiKey&region=galiyat'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['alerts'] != null) {
          return (data['alerts'] as List)
              .map((alert) => TravelAlertModel(
                    id: alert['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
                    title: alert['title'] ?? 'Alert',
                    severity: alert['severity'] ?? 'medium',
                    message: alert['message'] ?? '',
                  ))
              .toList();
        }
      }
      // If API fails or no data, fall back to mock data
      return _getMockAlerts();
    } catch (e) {
      // If there's an error, fall back to mock data
      return _getMockAlerts();
    }
  }

  List<TravelAlertModel> _getMockAlerts() {
    return const [
      TravelAlertModel(
        id: 'alert_1',
        title: 'Heavy Rain Warning',
        severity: 'high',
        message: 'Landslide warning near Dunga Gali. Travelers are advised to drive carefully and avoid overnight parking near slopes.',
      ),
      TravelAlertModel(
        id: 'alert_2',
        title: 'Fog Advisory',
        severity: 'medium',
        message: 'Dense fog expected on Murree Expressway between 8 PM and 6 AM. Keep headlights on low-beam.',
      ),
      TravelAlertModel(
        id: 'alert_3',
        title: 'Road Blockage Update',
        severity: 'low',
        message: 'Temporary maintenance active near Changla Gali. Short delays of 10-15 minutes can be expected.',
      ),
    ];
  }

  @override
  Future<List<AttractionModel>> getAttractions() async {
    await _simulateNetworkDelay();
    return const [
      AttractionModel(
        id: 'att_1',
        name: 'Mushkpuri Top',
        imageUrl: 'https://images.unsplash.com/photo-1501555088652-021faa106b9b?w=600&auto=format&fit=crop&q=80',
        rating: 4.8,
        distance: '4.5 km',
      ),
      AttractionModel(
        id: 'att_2',
        name: 'Pipeline Track',
        imageUrl: 'https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=600&auto=format&fit=crop&q=80',
        rating: 4.6,
        distance: '3.2 km',
      ),
      AttractionModel(
        id: 'att_3',
        name: 'Ayubia Chairlift',
        imageUrl: 'https://images.unsplash.com/photo-1473163928189-364b2c4e1135?w=600&auto=format&fit=crop&q=80',
        rating: 4.5,
        distance: '1.8 km',
      ),
      AttractionModel(
        id: 'att_4',
        name: 'Miranjani Track',
        imageUrl: 'https://images.unsplash.com/photo-1475924156734-496f6cac6ec1?w=600&auto=format&fit=crop&q=80',
        rating: 4.7,
        distance: '8.0 km',
      ),
      AttractionModel(
        id: 'att_5',
        name: 'Mukshpuri View Point',
        imageUrl: 'https://images.unsplash.com/photo-1486915309851-b0cc1f8a0084?w=600&auto=format&fit=crop&q=80',
        rating: 4.9,
        distance: '5.0 km',
      ),
    ];
  }

  @override
  Future<List<QuickActionModel>> getQuickActions() async {
    return const [
      QuickActionModel(id: 'qa_map', title: 'Explore Map', iconKey: 'map', route: '/map'),
      QuickActionModel(id: 'qa_weather', title: 'Weather Forecast', iconKey: 'weather', route: '/weather'),
      QuickActionModel(id: 'qa_emergency', title: 'Emergency Services', iconKey: 'emergency', route: '/emergency'),
      QuickActionModel(id: 'qa_hotels', title: 'Hotels', iconKey: 'hotel', route: '/hotels'),
      QuickActionModel(id: 'qa_hospitals', title: 'Hospitals', iconKey: 'hospital', route: '/hospitals'),
      QuickActionModel(id: 'qa_restaurants', title: 'Restaurants', iconKey: 'restaurant', route: '/restaurants'),
      QuickActionModel(id: 'qa_petrol', title: 'Petrol Pumps', iconKey: 'petrol', route: '/petrol'),
      QuickActionModel(id: 'qa_parking', title: 'Parking', iconKey: 'parking', route: '/parking'),
    ];
  }
}
