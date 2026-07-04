
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class TourismApiService {
  static const String baseUrl = 'http://172.16.104.217:8002';

  static final TourismApiService _instance = TourismApiService._internal();
  factory TourismApiService() => _instance;
  TourismApiService._internal();

  static String getImageUrl(String? path) {
    if (path == null || path.isEmpty) return '';
    if (path.startsWith('http')) return path;
    return '$baseUrl$path';
  }

  Future<bool> checkHealth() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health'));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getHotels({
    String? district,
    int? starRating,
  }) async {
    final queryParams = <String, String>{};
    if (district != null) queryParams['district'] = district;
    if (starRating != null) queryParams['star_rating'] = starRating.toString();

    final uri = Uri.parse('$baseUrl/hotels').replace(queryParameters: queryParams);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load hotels');
    }
  }

  Future<Map<String, dynamic>> getHotelById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/hotels/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load hotel');
    }
  }

  Future<Map<String, dynamic>> createHotel({
    required String name,
    String? description,
    String? district,
    String? address,
    double? latitude,
    double? longitude,
    String? phone,
    String? ownerName,
    int? starRating,
    int? pricePerNightMin,
    int? pricePerNightMax,
    List<String> amenities = const [],
    File? coverImage,
  }) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/hotels'),
    );

    request.fields['name'] = name;
    if (description != null) request.fields['description'] = description;
    if (district != null) request.fields['district'] = district;
    if (address != null) request.fields['address'] = address;
    if (latitude != null) request.fields['latitude'] = latitude.toString();
    if (longitude != null) request.fields['longitude'] = longitude.toString();
    if (phone != null) request.fields['phone'] = phone;
    if (ownerName != null) request.fields['owner_name'] = ownerName;
    if (starRating != null) request.fields['star_rating'] = starRating.toString();
    if (pricePerNightMin != null) request.fields['price_per_night_min'] = pricePerNightMin.toString();
    if (pricePerNightMax != null) request.fields['price_per_night_max'] = pricePerNightMax.toString();
    request.fields['amenities'] = jsonEncode(amenities);

    if (coverImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath('cover_image', coverImage.path),
      );
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to create hotel: ${response.body}');
    }
  }

  Future<List<Map<String, dynamic>>> getHospitals({
    String? district,
    bool? is247Emergency,
  }) async {
    final queryParams = <String, String>{};
    if (district != null) queryParams['district'] = district;
    if (is247Emergency != null) queryParams['is_24_7_emergency'] = is247Emergency.toString();

    final uri = Uri.parse('$baseUrl/hospitals').replace(queryParameters: queryParams);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load hospitals');
    }
  }

  Future<Map<String, dynamic>> getHospitalById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/hospitals/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load hospital');
    }
  }

  Future<Map<String, dynamic>> createHospital({
    required String name,
    String? description,
    String? district,
    String? address,
    double? latitude,
    double? longitude,
    String? phone,
    String? adminName,
    List<String> facilities = const [],
    bool is247Emergency = false,
    bool hasAmbulance = false,
    File? coverImage,
  }) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/hospitals'),
    );

    request.fields['name'] = name;
    if (description != null) request.fields['description'] = description;
    if (district != null) request.fields['district'] = district;
    if (address != null) request.fields['address'] = address;
    if (latitude != null) request.fields['latitude'] = latitude.toString();
    if (longitude != null) request.fields['longitude'] = longitude.toString();
    if (phone != null) request.fields['phone'] = phone;
    if (adminName != null) request.fields['admin_name'] = adminName;
    request.fields['facilities'] = jsonEncode(facilities);
    request.fields['is_24_7_emergency'] = is247Emergency.toString();
    request.fields['has_ambulance'] = hasAmbulance.toString();

    if (coverImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath('cover_image', coverImage.path),
      );
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to create hospital: ${response.body}');
    }
  }

  Future<List<Map<String, dynamic>>> getFuelPumps({
    String? district,
    bool? hasAtm,
    bool? hasShop,
  }) async {
    final queryParams = <String, String>{};
    if (district != null) queryParams['district'] = district;
    if (hasAtm != null) queryParams['has_atm'] = hasAtm.toString();
    if (hasShop != null) queryParams['has_shop'] = hasShop.toString();

    final uri = Uri.parse('$baseUrl/fuel-pumps').replace(queryParameters: queryParams);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load fuel pumps');
    }
  }

  Future<Map<String, dynamic>> getFuelPumpById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/fuel-pumps/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load fuel pump');
    }
  }

  Future<Map<String, dynamic>> createFuelPump({
    required String name,
    String? description,
    String? district,
    String? address,
    double? latitude,
    double? longitude,
    String? phone,
    String? ownerName,
    List<String> fuelTypes = const [],
    bool hasAtm = false,
    bool hasShop = false,
    File? coverImage,
  }) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/fuel-pumps'),
    );

    request.fields['name'] = name;
    if (description != null) request.fields['description'] = description;
    if (district != null) request.fields['district'] = district;
    if (address != null) request.fields['address'] = address;
    if (latitude != null) request.fields['latitude'] = latitude.toString();
    if (longitude != null) request.fields['longitude'] = longitude.toString();
    if (phone != null) request.fields['phone'] = phone;
    if (ownerName != null) request.fields['owner_name'] = ownerName;
    request.fields['fuel_types'] = jsonEncode(fuelTypes);
    request.fields['has_atm'] = hasAtm.toString();
    request.fields['has_shop'] = hasShop.toString();

    if (coverImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath('cover_image', coverImage.path),
      );
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to create fuel pump: ${response.body}');
    }
  }
}

