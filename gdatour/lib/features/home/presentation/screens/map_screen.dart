import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../admin/data/models/hospital_model.dart';
import '../../../admin/data/models/hotel_model.dart';
import '../../../admin/data/models/petrol_pump_model.dart';
import '../../../admin/data/providers/local_place_catalog_provider.dart';
import '../../providers/home_provider.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/gda_header.dart';

// ══════════════════════════════════════════════════════════════
// DATA MODELS
// ══════════════════════════════════════════════════════════════

enum PoiCategory { hotel, hospital, fuelPump, attraction, restaurant, parking }

class PoiItem {
  final String id;
  final String name;
  final String detail;
  final LatLng position;
  final PoiCategory category;
  final String? phone;

  const PoiItem({
    required this.id,
    required this.name,
    required this.detail,
    required this.position,
    required this.category,
    this.phone,
  });
}

class GdaRegion {
  final String id;
  final String name;
  final String description;
  final LatLng center;
  final double zoom;
  final List<PoiItem> pois;

  const GdaRegion({
    required this.id,
    required this.name,
    required this.description,
    required this.center,
    required this.zoom,
    required this.pois,
  });
}

// ══════════════════════════════════════════════════════════════
// GDA REGIONS DATA
// ══════════════════════════════════════════════════════════════
// IMPORTANT: These coordinates are approximate. For exact real-world locations,
// update the LatLng values with actual GPS coordinates from Google Maps or
// on-site GPS measurements. Use Google Maps to get precise coordinates:
// 1. Open Google Maps
// 2. Right-click on the exact location
// 3. Copy the coordinates (lat, lng)
// 4. Replace the LatLng values below

final List<GdaRegion> gdaRegions = [
  GdaRegion(
    id: 'nathia_gali',
    name: 'Nathia Gali',
    description: 'Scenic pine-forest hill station at 2,500m altitude',
    center: const LatLng(34.0614, 73.3817),
    zoom: 14.5,
    pois: const [
      PoiItem(
        id: 'ng_hotel_pine',
        name: 'Pine Palace Hotel',
        detail: '3-star hotel, mountain view rooms available',
        position: LatLng(34.0634, 73.3847),
        category: PoiCategory.hotel,
        phone: '+92-992-444-11',
      ),
      PoiItem(
        id: 'ng_hotel_forest',
        name: 'Forest Rest House',
        detail: 'Government rest house, booking required',
        position: LatLng(34.0594, 73.3807),
        category: PoiCategory.hotel,
        phone: '+92-992-444-22',
      ),
      PoiItem(
        id: 'ng_hotel_serene',
        name: 'Serene Hotel',
        detail: 'Budget-friendly, central location',
        position: LatLng(34.0624, 73.3797),
        category: PoiCategory.hotel,
        phone: '+92-992-444-33',
      ),
      PoiItem(
        id: 'ng_hosp_gda',
        name: 'GDA Hospital',
        detail: 'Government hospital, 24/7 emergency services',
        position: LatLng(34.0594, 73.3777),
        category: PoiCategory.hospital,
        phone: '1122',
      ),
      PoiItem(
        id: 'ng_hosp_clinic',
        name: 'Al-Shifa Clinic',
        detail: 'Private clinic, general medicine & OPD',
        position: LatLng(34.0604, 73.3827),
        category: PoiCategory.hospital,
        phone: '+92-992-333-11',
      ),
      PoiItem(
        id: 'ng_fuel_pso',
        name: 'PSO Pump',
        detail: 'Petrol & Diesel, open 6am–10pm',
        position: LatLng(34.0584, 73.3837),
        category: PoiCategory.fuelPump,
      ),
      PoiItem(
        id: 'ng_attr_viewpoint',
        name: 'Nathia Gali Viewpoint',
        detail: 'Stunning 180° panoramic view of Himalayan peaks',
        position: LatLng(34.0644, 73.3857),
        category: PoiCategory.attraction,
      ),
      PoiItem(
        id: 'ng_attr_church',
        name: 'St. Matthew\'s Church',
        detail: 'Historic colonial-era church, 1868',
        position: LatLng(34.0614, 73.3807),
        category: PoiCategory.attraction,
      ),
      PoiItem(
        id: 'ng_attr_golf',
        name: 'Golf Course',
        detail: 'Scenic 9-hole golf course in pine forest',
        position: LatLng(34.0604, 73.3867),
        category: PoiCategory.attraction,
      ),
      PoiItem(
        id: 'ng_rest_monal',
        name: 'Monal Restaurant',
        detail: 'Pakistani & Continental, mountain view dining',
        position: LatLng(34.0640, 73.3830),
        category: PoiCategory.restaurant,
      ),
      PoiItem(
        id: 'ng_park_main',
        name: 'Nathia Gali Main Parking',
        detail: '200 cars, Rs. 100/day — near Nathia Gali Bazar',
        position: LatLng(34.0580, 73.3810),
        category: PoiCategory.parking,
      ),
    ],
  ),
  GdaRegion(
    id: 'ayubia',
    name: 'Ayubia',
    description: 'National Park & famous chair-lift destination',
    center: const LatLng(34.0281, 73.4481),
    zoom: 14.5,
    pois: const [
      PoiItem(
        id: 'ayb_hotel_greens',
        name: 'Greens Hotel',
        detail: 'Family-friendly, central Ayubia location',
        position: LatLng(34.0301, 73.4501),
        category: PoiCategory.hotel,
        phone: '+92-992-555-11',
      ),
      PoiItem(
        id: 'ayb_hotel_pc',
        name: 'PC Bhurban',
        detail: '5-star luxury resort with full amenities',
        position: LatLng(33.9814, 73.4517),
        category: PoiCategory.hotel,
        phone: '+92-992-444-00',
      ),
      PoiItem(
        id: 'ayb_hosp_rhc',
        name: 'Ayubia RHC',
        detail: 'Rural Health Centre, basic services & OPD',
        position: LatLng(34.0261, 73.4461),
        category: PoiCategory.hospital,
        phone: '+92-992-445-60',
      ),
      PoiItem(
        id: 'ayb_fuel_shell',
        name: 'Shell Petrol Pump',
        detail: 'Petrol, Diesel & CNG, open 24 hours',
        position: LatLng(34.0271, 73.4471),
        category: PoiCategory.fuelPump,
      ),
      PoiItem(
        id: 'ayb_attr_chairlift',
        name: 'Ayubia Chair Lift',
        detail: 'Cable car connecting Ayubia to Dunaga Gali',
        position: LatLng(34.0271, 73.4491),
        category: PoiCategory.attraction,
      ),
      PoiItem(
        id: 'ayb_attr_park',
        name: 'Ayubia National Park',
        detail: 'Dense forest, wildlife & hiking trails',
        position: LatLng(34.0291, 73.4511),
        category: PoiCategory.attraction,
      ),
      PoiItem(
        id: 'ayb_attr_pipeline',
        name: 'Pipeline Track',
        detail: '6km scenic trail through deodar forest',
        position: LatLng(34.0311, 73.4531),
        category: PoiCategory.attraction,
      ),
      PoiItem(
        id: 'ayb_rest_cafe',
        name: 'Forest Café',
        detail: 'Chai, Parathas, Karahi — family friendly',
        position: LatLng(34.0295, 73.4495),
        category: PoiCategory.restaurant,
      ),
      PoiItem(
        id: 'ayb_park_chairlift',
        name: 'Ayubia Chairlift Parking',
        detail: '150 cars, Rs. 150/day — at chairlift entrance',
        position: LatLng(34.0265, 73.4465),
        category: PoiCategory.parking,
      ),
    ],
  ),
  GdaRegion(
    id: 'dunga_gali',
    name: 'Dunga Gali',
    description: 'Gateway to Mushkpuri Peak (2,787m)',
    center: const LatLng(34.0414, 73.4217),
    zoom: 14.5,
    pois: const [
      PoiItem(
        id: 'dg_hotel_mountain',
        name: 'Mountain Retreat',
        detail: 'Cozy guesthouse, trekker-friendly',
        position: LatLng(34.0434, 73.4237),
        category: PoiCategory.hotel,
        phone: '+92-992-666-11',
      ),
      PoiItem(
        id: 'dg_hosp_basic',
        name: 'Basic Health Unit',
        detail: 'First aid & basic medical care',
        position: LatLng(34.0404, 73.4207),
        category: PoiCategory.hospital,
        phone: '+92-992-666-22',
      ),
      PoiItem(
        id: 'dg_fuel_local',
        name: 'Local Fuel Stop',
        detail: 'Petrol available, limited hours',
        position: LatLng(34.0424, 73.4197),
        category: PoiCategory.fuelPump,
      ),
      PoiItem(
        id: 'dg_attr_mushkpuri',
        name: 'Mushkpuri Peak',
        detail: 'Highest peak in Galiyat, 360° Himalayan views',
        position: LatLng(34.0494, 73.4167),
        category: PoiCategory.attraction,
      ),
      PoiItem(
        id: 'dg_attr_trail',
        name: 'Mushkpuri Trail Head',
        detail: 'Starting point of the famous Mushkpuri hike',
        position: LatLng(34.0444, 73.4227),
        category: PoiCategory.attraction,
      ),
      PoiItem(
        id: 'dg_rest_dhaba',
        name: 'Mushkpuri Dhaba',
        detail: 'Daal, Roti, Lassi — trekker favourite',
        position: LatLng(34.0420, 73.4210),
        category: PoiCategory.restaurant,
      ),
      PoiItem(
        id: 'dg_park_trek',
        name: 'Dunga Gali Trek Parking',
        detail: '80 cars, Rs. 50/day — Mushkpuri trail start',
        position: LatLng(34.0410, 73.4200),
        category: PoiCategory.parking,
      ),
    ],
  ),
  GdaRegion(
    id: 'changla_gali',
    name: 'Changla Gali',
    description: 'Serene valley with dense deodar forest',
    center: const LatLng(34.0714, 73.4117),
    zoom: 14.0,
    pois: const [
      PoiItem(
        id: 'cg_hotel_deodar',
        name: 'Deodar Lodge',
        detail: 'Quiet retreat, forest-facing rooms',
        position: LatLng(34.0734, 73.4137),
        category: PoiCategory.hotel,
        phone: '+92-992-777-11',
      ),
      PoiItem(
        id: 'cg_hosp_clinic',
        name: 'Changla Medical Centre',
        detail: 'General OPD, no emergency services',
        position: LatLng(34.0704, 73.4107),
        category: PoiCategory.hospital,
        phone: '+92-992-777-22',
      ),
      PoiItem(
        id: 'cg_fuel_pump',
        name: 'Attock Fuel Station',
        detail: 'Petrol & Diesel, open 7am–9pm',
        position: LatLng(34.0694, 73.4097),
        category: PoiCategory.fuelPump,
      ),
      PoiItem(
        id: 'cg_attr_viewpoint',
        name: 'Changla Viewpoint',
        detail: 'Beautiful sunset point, valley views',
        position: LatLng(34.0744, 73.4147),
        category: PoiCategory.attraction,
      ),
      PoiItem(
        id: 'cg_rest_cafe',
        name: 'Changla View Point Café',
        detail: 'Hot drinks, sandwiches, sunset views',
        position: LatLng(34.0720, 73.4120),
        category: PoiCategory.restaurant,
      ),
      PoiItem(
        id: 'cg_park_view',
        name: 'Changla Viewpoint Parking',
        detail: '60 cars, Free — roadside informal parking',
        position: LatLng(34.0700, 73.4100),
        category: PoiCategory.parking,
      ),
    ],
  ),
  GdaRegion(
    id: 'thandiani',
    name: 'Thandiani',
    description: 'Cool retreat at 2,750m — panoramic Himalayan views',
    center: const LatLng(34.0814, 73.4517),
    zoom: 14.0,
    pois: const [
      PoiItem(
        id: 'th_hotel_summit',
        name: 'Summit View Hotel',
        detail: 'High-altitude hotel, amazing views',
        position: LatLng(34.0834, 73.4537),
        category: PoiCategory.hotel,
        phone: '+92-992-888-11',
      ),
      PoiItem(
        id: 'th_hosp_aid',
        name: 'First Aid Post',
        detail: 'Basic first aid, refer to Nathia for major cases',
        position: LatLng(34.0804, 73.4507),
        category: PoiCategory.hospital,
        phone: '1122',
      ),
      PoiItem(
        id: 'th_fuel_pump',
        name: 'Thandiani Fuel Point',
        detail: 'Petrol only, limited stock — fill up before going',
        position: LatLng(34.0794, 73.4497),
        category: PoiCategory.fuelPump,
      ),
      PoiItem(
        id: 'th_attr_top',
        name: 'Thandiani Top',
        detail: 'Highest accessible point, clouds at eye level',
        position: LatLng(34.0854, 73.4557),
        category: PoiCategory.attraction,
      ),
      PoiItem(
        id: 'th_attr_forest',
        name: 'Pine Forest Trail',
        detail: 'Peaceful walking trail through ancient pines',
        position: LatLng(34.0824, 73.4527),
        category: PoiCategory.attraction,
      ),
      PoiItem(
        id: 'th_rest_lounge',
        name: 'Summit Lounge',
        detail: 'Grills, outdoor seating, Himalayan views',
        position: LatLng(34.0830, 73.4520),
        category: PoiCategory.restaurant,
      ),
      PoiItem(
        id: 'th_park_top',
        name: 'Thandiani Top Parking',
        detail: '50 cars, Rs. 100/day — arrive early in peak season',
        position: LatLng(34.0790, 73.4490),
        category: PoiCategory.parking,
      ),
    ],
  ),
  GdaRegion(
    id: 'khanspur',
    name: 'Khanspur',
    description: 'Peaceful hamlet surrounded by ancient forests',
    center: const LatLng(34.0514, 73.4317),
    zoom: 14.0,
    pois: const [
      PoiItem(
        id: 'kp_hotel_pine',
        name: 'Khanspur Pine Nest',
        detail: 'Secluded cottages, perfect for families',
        position: LatLng(34.0534, 73.4337),
        category: PoiCategory.hotel,
        phone: '+92-992-999-11',
      ),
      PoiItem(
        id: 'kp_hosp_unit',
        name: 'Rural Health Unit',
        detail: 'Basic healthcare, refer elsewhere for emergency',
        position: LatLng(34.0504, 73.4307),
        category: PoiCategory.hospital,
        phone: '+92-992-999-22',
      ),
      PoiItem(
        id: 'kp_fuel_mini',
        name: 'Mini Fuel Point',
        detail: 'Petrol only, fill tank before arriving',
        position: LatLng(34.0494, 73.4297),
        category: PoiCategory.fuelPump,
      ),
      PoiItem(
        id: 'kp_attr_meadow',
        name: 'Khanspur Meadow',
        detail: 'Open green meadow, ideal for picnics',
        position: LatLng(34.0544, 73.4347),
        category: PoiCategory.attraction,
      ),
      PoiItem(
        id: 'kp_rest_nest',
        name: 'Pine Nest Café',
        detail: 'Nihari, Paye, Fresh Naan',
        position: LatLng(34.0520, 73.4320),
        category: PoiCategory.restaurant,
      ),
      PoiItem(
        id: 'kp_park_meadow',
        name: 'Khanspur Meadow Parking',
        detail: '40 cars, Free — near forest area',
        position: LatLng(34.0500, 73.4300),
        category: PoiCategory.parking,
      ),
    ],
  ),
];

// ══════════════════════════════════════════════════════════════
// MAP SCREEN
// ══════════════════════════════════════════════════════════════

class GdaMapScreen extends ConsumerStatefulWidget {
  /// Optional initial category to auto-select when coming from Explore screen
  final PoiCategory? initialCategory;
  final String? initialRegionId;
  final String? initialPoiId;

  const GdaMapScreen({
    super.key,
    this.initialCategory,
    this.initialRegionId,
    this.initialPoiId,
  });

  @override
  ConsumerState<GdaMapScreen> createState() => _GdaMapScreenState();
}

class _GdaMapScreenState extends ConsumerState<GdaMapScreen>
    with TickerProviderStateMixin {
  final Completer<GoogleMapController> _mapCompleter = Completer();
  GoogleMapController? _mapController;
  String _lastCatalogSignature = '';

  static const CameraPosition _galiyatOverview = CameraPosition(
    target: LatLng(34.0514, 73.4117),
    zoom: 11.5,
  );

  // State
  GdaRegion? _selectedRegion;
  final Set<PoiCategory> _activeCategories = {};
  PoiItem? _selectedPoi;
  bool _isLocating = false;
  MapType _mapType = MapType.normal;
  late AnimationController _sheetAnim;
  late CurvedAnimation _sheetSlide;

  // Markers
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _sheetAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );
    _sheetSlide = CurvedAnimation(parent: _sheetAnim, curve: Curves.easeOutCubic);

    // If initial category is passed (from Explore screen), auto-enable it
    if (widget.initialCategory != null) {
      _activeCategories.add(widget.initialCategory!);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final region = _resolveInitialRegion();
      if (region != null) {
        _onRegionSelected(region, autoSelectPoiId: widget.initialPoiId);
      }
    });
  }

  @override
  void dispose() {
    _sheetAnim.dispose();
    _mapController?.dispose();
    super.dispose();
  }

  // ── Region selected ───────────────────────────────────────
  void _onRegionSelected(GdaRegion? region, {String? autoSelectPoiId}) {
    setState(() {
      _selectedRegion = region;
      _selectedPoi = null;
      _markers = {};

      // Only keep Explore-provided categories or auto-selected POI category, don't auto-select all
      if (widget.initialCategory != null) {
        _activeCategories
          ..clear()
          ..add(widget.initialCategory!);
      } else if (autoSelectPoiId != null) {
        // Keep it empty for now, will handle below
      } else {
        // Clear all categories for user to select manually
        _activeCategories.clear();
      }
    });
    _sheetAnim.reset();

    if (region != null) {
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: region.center, zoom: region.zoom),
        ),
      );

      if (_activeCategories.isNotEmpty) {
        _buildMarkers(autoSelectPoiId: autoSelectPoiId);
      } else if (autoSelectPoiId != null) {
        final poi = _poisForRegion(region).where((p) => p.id == autoSelectPoiId).firstOrNull;
        if (poi != null) {
          setState(() {
            _activeCategories.add(poi.category);
          });
          _buildMarkers(autoSelectPoiId: autoSelectPoiId);
        }
      }
    } else {
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(_galiyatOverview),
      );
    }
  }

  // ── Category toggled ──────────────────────────────────────
  void _toggleCategory(PoiCategory cat) {
    setState(() {
      if (_activeCategories.contains(cat)) {
        _activeCategories.remove(cat);
      } else {
        _activeCategories.add(cat);
      }
      _selectedPoi = null;
    });
    _sheetAnim.reset();
    _buildMarkers();
  }

  // ── Build markers ─────────────────────────────────────────
  void _buildMarkers({String? autoSelectPoiId}) {
    if (_selectedRegion == null) {
      setState(() => _markers = {});
      return;
    }
    final Set<Marker> m = {};
    for (final poi in _poisForRegion(_selectedRegion!)) {
      if (!_activeCategories.contains(poi.category)) continue;

      final bool isSelected = _selectedPoi?.id == poi.id;
      final label = _catLabel(poi.category);

      m.add(Marker(
        markerId: MarkerId(poi.id),
        position: poi.position,
        anchor: const Offset(0.5, 1.0),
        icon: isSelected
            ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow)
            : _markerIcon(poi.category),
        infoWindow: InfoWindow(
          title: '$label • ${poi.name}',
          snippet: poi.detail,
        ),
        zIndexInt: isSelected ? 2 : 1,
        onTap: () => _onPoiTapped(poi),
      ));
    }
    setState(() => _markers = m);

    if (autoSelectPoiId != null) {
      final poi = _poisForRegion(_selectedRegion!)
          .where((p) => p.id == autoSelectPoiId)
          .firstOrNull;
      if (poi != null) {
        _onPoiTapped(poi);
        return;
      }
    }

    if (_selectedPoi == null) {
      _fitMarkersInView();
    }
  }

  GdaRegion? _resolveInitialRegion() {
    if (widget.initialRegionId != null) {
      for (final region in gdaRegions) {
        if (region.id == widget.initialRegionId) {
          return region;
        }
      }
    }

    final selectedRegionId = ref.read(homeProvider).selectedRegion?.id;
    if (selectedRegionId != null) {
      for (final region in gdaRegions) {
        if (region.id == selectedRegionId) {
          return region;
        }
      }
    }

    return gdaRegions.isNotEmpty ? gdaRegions.first : null;
  }

  Future<void> _fitMarkersInView() async {
    if (_markers.isEmpty || _mapController == null) return;

    final positions = _markers.map((m) => m.position).toList();
    if (positions.length == 1) {
      await _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: positions.first, zoom: 15.5),
        ),
      );
      return;
    }

    var minLat = positions.first.latitude;
    var maxLat = positions.first.latitude;
    var minLng = positions.first.longitude;
    var maxLng = positions.first.longitude;

    for (final p in positions) {
      if (p.latitude < minLat) minLat = p.latitude;
      if (p.latitude > maxLat) maxLat = p.latitude;
      if (p.longitude < minLng) minLng = p.longitude;
      if (p.longitude > maxLng) maxLng = p.longitude;
    }

    final bounds = LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );

    try {
      await _mapController!.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 80),
      );
    } catch (_) {
      await _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng((minLat + maxLat) / 2, (minLng + maxLng) / 2),
          14,
        ),
      );
    }
  }

  List<PoiItem> get _visiblePois {
    if (_selectedRegion == null || _activeCategories.isEmpty) return [];
    return _poisForRegion(_selectedRegion!)
        .where((p) => _activeCategories.contains(p.category))
        .toList();
  }

  List<PoiItem> _poisForRegion(GdaRegion region) {
    final catalog = ref.read(localPlaceCatalogProvider);
    return [
      ...region.pois,
      ...catalog.hotels
          .where((hotel) => hotel.regionId == region.id)
          .map(_hotelToPoi),
      ...catalog.hospitals
          .where((hospital) => hospital.regionId == region.id)
          .map(_hospitalToPoi),
      ...catalog.petrolPumps
          .where((pump) => pump.regionId == region.id)
          .map(_petrolPumpToPoi),
    ];
  }

  PoiItem _hotelToPoi(HotelModel hotel) {
    return PoiItem(
      id: 'hotel_${hotel.id}',
      name: hotel.name,
      detail: '${hotel.description}\n${hotel.address}',
      position: LatLng(hotel.latitude, hotel.longitude),
      category: PoiCategory.hotel,
      phone: hotel.contactNumber,
    );
  }

  PoiItem _hospitalToPoi(HospitalModel hospital) {
    return PoiItem(
      id: 'hospital_${hospital.id}',
      name: hospital.name,
      detail: '${hospital.description}\n${hospital.address}',
      position: LatLng(hospital.latitude, hospital.longitude),
      category: PoiCategory.hospital,
      phone: hospital.contactNumber,
    );
  }

  PoiItem _petrolPumpToPoi(PetrolPumpModel pump) {
    return PoiItem(
      id: 'pump_${pump.id}',
      name: pump.name,
      detail: '${pump.description}\n${pump.address}',
      position: LatLng(pump.latitude, pump.longitude),
      category: PoiCategory.fuelPump,
      phone: pump.contactNumber,
    );
  }

  BitmapDescriptor _markerIcon(PoiCategory cat) {
    switch (cat) {
      case PoiCategory.hotel:
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);
      case PoiCategory.hospital:
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
      case PoiCategory.fuelPump:
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
      case PoiCategory.attraction:
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet);
      case PoiCategory.restaurant:
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose);
      case PoiCategory.parking:
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
    }
  }

  void _onPoiTapped(PoiItem poi) {
    setState(() => _selectedPoi = poi);
    _sheetAnim.forward(from: 0);

    // Zoom in precisely to the POI's pinpoint location at level 16
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: poi.position,
          zoom: 16.0,
          tilt: 30.0, // slight tilt for visual depth
        ),
      ),
    );

    // Rebuild markers so selected one gets highlighted (yellow)
    _buildMarkers();
  }

  void _dismissSheet() {
    _sheetAnim.reverse().then((_) {
      setState(() => _selectedPoi = null);
      // Rebuild markers to remove yellow highlight
      _buildMarkers();
    });
  }

  Future<void> _locateUser() async {
    final status = await Permission.locationWhenInUse.request();
    if (!status.isGranted) return;
    setState(() => _isLocating = true);
    try {
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(pos.latitude, pos.longitude), 14),
      );
    } catch (_) {}
    setState(() => _isLocating = false);
  }

  /// Open turn-by-turn directions in Google Maps
  Future<void> _openDirections(LatLng destination, String name) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&destination=${destination.latitude},${destination.longitude}',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Directions open nahi ho saki'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  /// Open pinpoint location in Google Maps external app
  Future<void> _openInGoogleMaps(LatLng position, String name) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Google Maps open nahi ho saka'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  // ── POI Picker — user selects exact location ───────────────
  Widget _buildPoiPicker() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    final pois = _visiblePois;
    if (pois.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: isDark ? AppColors.darkShadow : AppColors.lightShadow,
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.touch_app_rounded,
                size: 16,
                color: isDark
                    ? AppColors.darkPrimary
                    : AppColors.lightPrimary,
              ),
              const SizedBox(width: 8),
              Text(
                'SELECT EXACT LOCATION',
                style: textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: pois.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final poi = pois[index];
                final color = _catColor(poi.category);
                return ActionChip(
                  avatar: Icon(_catIcon(poi.category), size: 18, color: color),
                  label: Text(
                    poi.name,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: color,
                    ),
                  ),
                  backgroundColor: color.withValues(alpha: 0.10),
                  side: BorderSide(color: color.withValues(alpha: 0.4), width: 1.5),
                  onPressed: () => _onPoiTapped(poi),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ── UI ────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final catalog = ref.watch(localPlaceCatalogProvider);
    final catalogSignature =
        '${catalog.hotels.length}:${catalog.hospitals.length}:${catalog.petrolPumps.length}';

    if (catalogSignature != _lastCatalogSignature) {
      _lastCatalogSignature = catalogSignature;
      if (_selectedRegion != null && _activeCategories.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _buildMarkers();
          }
        });
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          // ── Google Map ──────────────────────────────────
          GoogleMap(
            initialCameraPosition: _galiyatOverview,
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            mapType: _mapType,
            onMapCreated: (c) {
              _mapController = c;
              if (!_mapCompleter.isCompleted) _mapCompleter.complete(c);
              // If region not yet selected but category is pre-set, show overview
            },
            onTap: (_) {
              if (_selectedPoi != null) _dismissSheet();
            },
          ),

          // ── Top panel ───────────────────────────────────
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildTopPanel(context),
          ),

          // ── FABs ────────────────────────────────────────
          Positioned(
            right: 14,
            bottom: _selectedPoi != null
                ? 290
                : (_selectedRegion != null && _activeCategories.isNotEmpty ? 180 : 100),
            child: Column(
              children: [
                _fab(
                  icon: Icons.map_rounded,
                  onTap: () {
                    setState(() {
                      if (_mapType == MapType.normal) {
                        _mapType = MapType.satellite;
                      } else if (_mapType == MapType.satellite) {
                        _mapType = MapType.terrain;
                      } else {
                        _mapType = MapType.normal;
                      }
                    });
                  },
                  tooltip: 'Map Type',
                ),
                const SizedBox(height: 12),
                _fab(
                  icon: Icons.my_location_rounded,
                  onTap: _isLocating ? null : _locateUser,
                  isLoading: _isLocating,
                  tooltip: 'My Location',
                ),
              ],
            ),
          ),

          // ── POI Picker (select exact location) ─────────
          if (_selectedRegion != null && _activeCategories.isNotEmpty && _selectedPoi == null)
            Positioned(
              left: 0,
              right: 0,
              bottom: 90,
              child: _buildPoiPicker(),
            ),

          // ── POI Info Sheet ───────────────────────────────
          if (_selectedPoi != null) _buildInfoSheet(_selectedPoi!),
        ],
      ),
    );
  }

  // ── Top Panel ─────────────────────────────────────────────
  Widget _buildTopPanel(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GdaHeaderBar(
            title: 'GDA Map Explorer',
            showBackButton: true,
            onBackPressed: () {
              Navigator.pop(context);
            },
            actions: [
              if (_selectedRegion != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.darkPrimaryContainer
                        : AppColors.lightPrimaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '${_currentPoiCount()} POIs',
                    style: textTheme.labelMedium?.copyWith(
                      color: isDark
                          ? AppColors.darkPrimary
                          : AppColors.lightPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            decoration: BoxDecoration(
              color: colorScheme.surface.withValues(alpha: 0.96),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              border: Border(
                bottom: BorderSide(color: colorScheme.outlineVariant),
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark ? AppColors.darkShadow : AppColors.lightShadow,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildPanelSection(
                  context,
                  icon: Icons.looks_one_rounded,
                  title: 'Select Region',
                  child: _buildRegionDropdown(context),
                ),
                if (_selectedRegion != null) ...[
                  const SizedBox(height: 12),
                  _buildPanelSection(
                    context,
                    icon: Icons.looks_two_rounded,
                    title: 'Select Category',
                    child: _buildCategoryChips(context),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPanelSection(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                title.toUpperCase(),
                style: textTheme.labelSmall?.copyWith(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  // ── Region Dropdown ───────────────────────────────────────
  Widget _buildRegionDropdown(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark ? AppColors.darkShadow : AppColors.lightShadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: -2,
          ),
        ],
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<GdaRegion>(
          value: _selectedRegion,
          isExpanded: true,
          borderRadius: BorderRadius.circular(16),
          dropdownColor: colorScheme.surface,
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  Icons.landscape_rounded,
                  color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  'Select GDA region...',
                  style: textTheme.bodyMedium?.copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          selectedItemBuilder: (context) {
            return [
              ...gdaRegions.map((r) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.landscape_rounded,
                          color: isDark
                              ? AppColors.darkPrimary
                              : AppColors.lightPrimary,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            r.name,
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ];
          },
          items: gdaRegions.map((region) {
            return DropdownMenuItem(
              value: region,
              child: Row(
                children: [
                  Icon(
                    Icons.landscape_rounded,
                    color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          region.name,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          region.description,
                          style: textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.lightTextSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (region) {
            _onRegionSelected(region);
          },
        ),
      ),
    );
  }

  // ── Category Chips ─────────────────────────────────────────
  Widget _buildCategoryChips(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        itemCount: PoiCategory.values.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final cat = PoiCategory.values[index];
          final color = _catColor(cat);
          final isSelected = _activeCategories.contains(cat);
          return FilterChip(
            selected: isSelected,
            label: Text(
              _catLabel(cat),
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: isSelected
                    ? color
                    : colorScheme.onSurface,
              ),
            ),
            onSelected: (_) => _toggleCategory(cat),
            avatar: Icon(
              _catIcon(cat),
              color: isSelected
                  ? color
                  : colorScheme.onSurface.withValues(alpha: 0.7),
              size: 18,
            ),
            backgroundColor: colorScheme.surface,
            selectedColor: color.withValues(alpha: 0.12),
            checkmarkColor: color,
            side: BorderSide(
              color: isSelected
                  ? color
                  : colorScheme.outline,
              width: isSelected ? 1.5 : 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          );
        },
      ),
    );
  }
  // ── Info Sheet ────────────────────────────────────────────
  Widget _buildInfoSheet(PoiItem poi) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    final color = _catColor(poi.category);
    final icon = _catIcon(poi.category);
    final label = _catLabel(poi.category);

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: AnimatedBuilder(
        animation: _sheetSlide,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, 350 * (1 - _sheetSlide.value)),
          child: child,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: isDark ? AppColors.darkShadow : AppColors.lightShadow,
                blurRadius: 24,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 34),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.darkTextSecondary.withValues(alpha: 0.3)
                        : AppColors.lightTextSecondary.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(icon, color: color, size: 28),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          poi.name,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.lightTextPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: color.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                label,
                                style: textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: color,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _selectedRegion?.name ?? '',
                              style: textTheme.bodySmall?.copyWith(
                                color: isDark
                                    ? AppColors.darkTextSecondary
                                    : AppColors.lightTextSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: _dismissSheet,
                    icon: const Icon(Icons.close_rounded),
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                ],
              ),

              const SizedBox(height: 14),
              Text(
                poi.detail,
                style: textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),

              // Coordinates row
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.location_on_rounded,
                      size: 16,
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary),
                  const SizedBox(width: 8),
                  Text(
                    '${poi.position.latitude.toStringAsFixed(4)}°N, ${poi.position.longitude.toStringAsFixed(4)}°E',
                    style: textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),

              if (poi.phone != null) ...[
                const SizedBox(height: 14),
                Row(
                  children: [
                    Icon(Icons.phone_rounded,
                        size: 18,
                        color: isDark
                            ? AppColors.darkPrimary
                            : AppColors.lightPrimary),
                    const SizedBox(width: 10),
                    Text(
                      poi.phone!,
                      style: textTheme.bodyMedium?.copyWith(
                        color: isDark
                            ? AppColors.darkPrimary
                            : AppColors.lightPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        _mapController?.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: poi.position,
                              zoom: 17.0,
                              tilt: 45.0,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.zoom_in_rounded, size: 16),
                      label: const Text('Zoom In'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: color,
                        side: BorderSide(color: color),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _openInGoogleMaps(poi.position, poi.name),
                      icon: const Icon(Icons.open_in_new_rounded, size: 16),
                      label: const Text('Google Maps'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark
                            ? AppColors.darkPrimaryContainer
                            : AppColors.lightPrimaryContainer,
                        foregroundColor: isDark
                            ? AppColors.darkPrimary
                            : AppColors.lightPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _openDirections(poi.position, poi.name),
                      icon: const Icon(Icons.directions_rounded, size: 16),
                      label: const Text('Directions'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── FAB ───────────────────────────────────────────────────
  Widget _fab({
    required IconData icon,
    required VoidCallback? onTap,
    String? tooltip,
    bool isLoading = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Tooltip(
      message: tooltip ?? '',
      child: Material(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        shape: const CircleBorder(),
        elevation: 8,
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: 52,
            height: 52,
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: isDark
                              ? AppColors.darkPrimary
                              : AppColors.lightPrimary),
                    )
                  : Icon(
                      icon,
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                      size: 24,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────
  int _currentPoiCount() {
    if (_selectedRegion == null || _activeCategories.isEmpty) return 0;
    return _poisForRegion(_selectedRegion!)
        .where((p) => _activeCategories.contains(p.category))
        .length;
  }

  Color _catColor(PoiCategory cat) {
    switch (cat) {
      case PoiCategory.hotel:
        return AppColors.lightInfo;
      case PoiCategory.hospital:
        return AppColors.lightError;
      case PoiCategory.fuelPump:
        return AppColors.lightWarning;
      case PoiCategory.attraction:
        return AppColors.lightPrimary;
      case PoiCategory.restaurant:
        return AppColors.lightSecondary;
      case PoiCategory.parking:
        return AppColors.lightIconMuted;
    }
  }

  IconData _catIcon(PoiCategory cat) {
    switch (cat) {
      case PoiCategory.hotel:       return Icons.hotel_rounded;
      case PoiCategory.hospital:    return Icons.local_hospital_rounded;
      case PoiCategory.fuelPump:    return Icons.local_gas_station_rounded;
      case PoiCategory.attraction:  return Icons.stars_rounded;
      case PoiCategory.restaurant:  return Icons.restaurant_rounded;
      case PoiCategory.parking:     return Icons.local_parking_rounded;
    }
  }

  String _catLabel(PoiCategory cat) {
    switch (cat) {
      case PoiCategory.hotel:       return 'Hotel';
      case PoiCategory.hospital:    return 'Hospital';
      case PoiCategory.fuelPump:    return 'Petrol Pump';
      case PoiCategory.attraction:  return 'Attraction';
      case PoiCategory.restaurant:  return 'Restaurant';
      case PoiCategory.parking:     return 'Parking';
    }
  }
}
