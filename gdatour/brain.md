# GDA Tourism App - Brain (Comprehensive Documentation)

This document serves as the "brain" of the GDA Tourism app. It outlines the entire architecture, feature set, tech stack, and state of the application to serve as a complete reference guide for developers.

---

## 1. Project Overview
**GDA Tourism App** is a Flutter-based mobile application acting as a digital tourism guide for the Galiyat Development Authority (GDA) region in Pakistan. 

**Core Objectives:**
- Provide a directory for tourists to find hotels, hospitals, petrol pumps, and scenic attractions.
- Deliver real-time weather information across Galiyat regions.
- Provide a map integration for location-based services and POIs.
- Enable local business owners to register their establishments.
- Offer an Admin Dashboard to manage directory data.

---

## 2. Tech Stack & Dependencies
The app leverages modern Flutter development practices.

- **Framework:** Flutter (Dart)
- **State Management:** Riverpod (`flutter_riverpod`)
- **Navigation:** GoRouter (`go_router`)
- **Data Modeling & Serialization:** Freezed (`freezed`, `freezed_annotation`) and JSON Serializable (`json_serializable`, `json_annotation`)
- **Native Integrations & APIs:** 
  - `google_maps_flutter` (Map rendering)
  - `geolocator` (Location tracking)
  - `image_picker` (Picking images from local device for directory listings)
  - `permission_handler` (Managing native permissions)
  - `shared_preferences` (Local storage)
  - `flutter_dotenv` (Environment variables management)
- **UI Enhancements:**
  - `shimmer` (Loading animations)
  - `cupertino_icons`

---

## 3. Directory Structure and Architecture
The app follows a **Feature-First / Clean Architecture** approach:

```text
lib/
├── core/                           # Core application utilities
│   ├── navigation/
│   │   └── app_router.dart         # GoRouter configuration & ShellRoute (Bottom Navigation)
│   └── splash_screen.dart          # Initial loading screen
├── features/                       # Feature modules
│   ├── home/                       # User-facing features
│   │   ├── data/                   # Models & Repositories
│   │   ├── domain/                 # Business logic interfaces
│   │   ├── presentation/           # Screens and Widgets (Home, Explore, Map, Weather, etc.)
│   │   └── providers/              # Riverpod State Providers
│   └── admin/                      # Admin panel features
│       ├── data/                   # Admin data models (Hotel, Hospital, PetrolPump)
│       └── presentation/           # Admin Screens (Add Hotel, Add Hospital, etc.)
└── main.dart                       # App entry point & Theme configuration
```

---

## 4. Theming and Design System
The app features a custom, comprehensive design system managed in `main.dart`.
- **Palette:** Sage (`#9CB080`), Green (`#618764`), Pine (`#2B5748`), Deep (`#273338`).
- **Modes:** Full support for both `Brightness.light` and `Brightness.dark`.
- **Components Customization:** `ElevatedButtonTheme`, `OutlinedButtonTheme`, `ChipTheme`, and `BottomNavigationBarTheme` are globally customized to match the brand identity.

---

## 5. Navigation Flow
Routing is handled by `GoRouter`. The core layout uses a `ShellRoute` with a `BottomNavigationBar`.
- **`/` (Home):** Landing page, Featured Regions, Highlights.
  - Sub-routes: `region/:regionId`, `weather`
- **`/explore`:** Categorized directory of all services and attractions.
- **`/map`:** Google Maps integration highlighting specific POIs.
- **`/emergency`:** Quick access to emergency contacts and alerts.
- **`/profile`:** User settings and login/account management.
- **`/admin`:** Admin Dashboard for data management.
  - Sub-routes: `add-hotel`, `add-petrol-pump`, `add-hospital`.

---

## 6. Data Models
All core data models are generated using `Freezed` for immutability and pattern matching.
- **`HotelModel`:** Includes `name`, `address`, `coordinates`, `rating`, `priceRange`, `amenities`, and `imageUrl`.
- **`PetrolPumpModel`:** Includes `fuelTypes`, `hasATM`, `hasShop`, and `imageUrl`.
- **`HospitalModel`:** Includes `facilities`, `hasEmergency247`, `hasAmbulance`, and `imageUrl`.
- **`RegionModel`:** Data for specific areas (Murree, Nathia Gali, etc.).
- **`WeatherModel`:** Current conditions and forecast.

---

## 7. Recent Implementations & Features
- **Local Image Picker:** Integrated `image_picker` on the Admin side. Admins can tap a photo library icon when creating a new Hotel, Hospital, or Petrol Pump to pick an image directly from the device gallery.
- **Dynamic List Additions:** Added custom `+` dialogs on Admin creation screens, allowing users to dynamically add custom `Amenities` (Hotels), `Fuel Types` (Petrol Pumps), and `Facilities` (Hospitals) on the fly instead of relying strictly on hardcoded lists.
- **API Integration:** Connected the app to a FastAPI backend. Created `TourismApiService` in `lib/services/tourism_api_service.dart` with methods for:
  - Health check
  - Getting hotels (with filters)
  - Getting hospitals (with filters)
  - Getting fuel pumps (with filters)
  - Creating hotels/hospitals/fuel pumps (with image upload via multipart/form-data)
  - Image URL helper: `TourismApiService.getImageUrl()` to construct full image URLs
- Updated Admin Dashboard to fetch stats from API
- Updated Manage List Screens to fetch and display data from API
- Updated Add Screens to use API for creating new entries

---

## 8. Development Guidelines
- Always run `flutter pub run build_runner build --delete-conflicting-outputs` when modifying any Freezed models (`.dart` files containing `@freezed`).
- Manage environment variables (like Google Maps API keys) in the `.env` file at the root.
- Keep UI components decoupled from business logic using Riverpod `ConsumerWidget` or `ConsumerStatefulWidget`.

---


