# GDA Tourism App - Documentation

## Table of Contents
1. [Project Overview](#project-overview)
2. [Tech Stack](#tech-stack)
3. [Architecture](#architecture)
4. [Features](#features)
5. [Data Models](#data-models)
6. [API Structure](#api-structure)
7. [Setup Instructions](#setup-instructions)
8. [Development Guidelines](#development-guidelines)

---

## Project Overview

**GDA Tourism App** is a comprehensive mobile application for the Galiyat Development Authority (GDA) region in Pakistan. The app serves as a digital tourism guide, helping visitors explore Galiyat's scenic locations, find accommodations, access emergency services, and discover local attractions.

### Key Objectives
- Provide real-time weather information for all Galiyat regions
- Help tourists find hotels, petrol pumps, hospitals, and attractions
- Enable location-based services with map integration
- Allow businesses to register their establishments
- Provide emergency contact information and travel alerts
- Support multiple languages (future scope)

### Target Audience
- Domestic and international tourists visiting Galiyat
- Local business owners (hotels, restaurants, petrol pumps)
- GDA administration and emergency services
- Travel agencies and tour operators

---

## Tech Stack

### Frontend
- **Framework**: Flutter 3.x
- **Language**: Dart
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **Code Generation**: Freezed, json_serializable

### Backend (Planned)
- **Backend Framework**: Node.js / Express or Firebase
- **Database**: PostgreSQL / MongoDB
- **Authentication**: Firebase Auth / JWT
- **Maps**: Google Maps API / Mapbox
- **Weather API**: OpenWeatherMap API
- **Push Notifications**: Firebase Cloud Messaging

### Development Tools
- **IDE**: VS Code / Android Studio
- **Version Control**: Git
- **CI/CD**: GitHub Actions (planned)

---

## Architecture

### Project Structure
```
lib/
├── core/
│   ├── navigation/
│   │   └── app_router.dart          # Navigation configuration
│   └── splash_screen.dart           # App splash screen
├── features/
│   ├── home/
│   │   ├── data/
│   │   │   ├── models/              # Data models
│   │   │   └── repositories/        # Data repositories
│   │   ├── domain/
│   │   │   └── repositories/        # Repository interfaces
│   │   ├── presentation/
│   │   │   ├── screens/             # Screen widgets
│   │   │   ├── widgets/             # Reusable widgets
│   │   │   └── state/               # State management
│   │   └── providers/               # Riverpod providers
│   ├── admin/
│   │   ├── data/
│   │   │   └── models/              # Admin data models
│   │   └── presentation/
│   │       └── screens/             # Admin screens
│   └── map/                         # Map feature (planned)
└── main.dart                        # App entry point
```

### Architecture Pattern
- **Clean Architecture**: Separation of concerns with data, domain, and presentation layers
- **MVVM**: Model-View-ViewModel pattern with Riverpod
- **Repository Pattern**: Abstract data access through repositories

---

## Features

### Current Features

#### 1. Home Screen
- Auto-sliding image carousel of scenic locations
- Current weather display with region selector
- Hotels section with region-based filtering
- Popular attractions showcase
- Travel alerts and notifications

#### 2. Explore Screen
- Quick action grid for various services
- Map access
- Weather forecast
- Emergency services
- Hotel listings
- Hospital locations
- Restaurant directory
- Petrol pump finder
- Parking information

#### 3. Weather System
- Real-time weather for all Galiyat regions
- Temperature, humidity, wind speed
- Weather conditions (sunny, cloudy, rainy, foggy)
- Hourly updates
- Region-based weather switching

#### 4. Region Selection
- Modal bottom sheet for region selection
- Support for Nathia Gali, Ayubia, Dunga Gali, Changla Gali
- Dynamic content based on selected region

#### 5. Admin Panel
- Dashboard with management options
- Add hotels with coordinates, amenities, ratings
- Add petrol pumps with fuel types, facilities
- Add hospitals with medical facilities
- Approval system for user submissions (planned)

#### 6. Profile Screen
- User profile management
- Settings
- Help & support
- Admin panel access

### Planned Features

#### 1. Map Integration
- Interactive map with all locations
- GPS-based navigation
- Real-time location tracking
- Route planning
- Distance calculation

#### 2. User Registration
- Hotel registration form for business owners
- Petrol pump registration
- Hospital registration
- Document upload
- Status tracking (pending/approved/rejected)

#### 3. Booking System
- Hotel booking
- Restaurant reservations
- Tour packages
- Payment integration

#### 4. Reviews & Ratings
- User reviews for hotels and attractions
- Rating system
- Photo uploads
- Report inappropriate content

#### 5. Multi-language Support
- English
- Urdu
- Other regional languages

#### 6. Offline Mode
- Download maps for offline use
- Cached weather data
- Offline directory access

---

## Data Models

### Region Model
```dart
class RegionModel {
  String id;
  String name;
  String shortDescription;
  String imageUrl;
  List<String> viewpoints;
  List<String> hotels;
}
```

### Hotel Model
```dart
class HotelModel {
  String id;
  String name;
  String description;
  String regionId;
  String address;
  double latitude;
  double longitude;
  String contactNumber;
  String ownerName;
  String status; // pending, approved, rejected
  String imageUrl;
  List<String> amenities;
  int rating;
  int priceRange;
  DateTime createdAt;
  DateTime approvedAt;
}
```

### Petrol Pump Model
```dart
class PetrolPumpModel {
  String id;
  String name;
  String description;
  String regionId;
  String address;
  double latitude;
  double longitude;
  String contactNumber;
  String ownerName;
  String status;
  List<String> fuelTypes;
  bool hasATM;
  bool hasShop;
  DateTime createdAt;
  DateTime approvedAt;
}
```

### Hospital Model
```dart
class HospitalModel {
  String id;
  String name;
  String description;
  String regionId;
  String address;
  double latitude;
  double longitude;
  String contactNumber;
  String adminName;
  String status;
  List<String> facilities;
  bool hasEmergency247;
  bool hasAmbulance;
  DateTime createdAt;
  DateTime approvedAt;
}
```

### Weather Model
```dart
class WeatherModel {
  String regionName;
  double temperature;
  String condition;
  double humidity;
  double windSpeed;
}
```

---

## API Structure (Planned)

### Authentication Endpoints
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout
- `POST /api/auth/refresh` - Refresh token

### Region Endpoints
- `GET /api/regions` - Get all regions
- `GET /api/regions/:id` - Get region details
- `GET /api/regions/:id/hotels` - Get hotels in region
- `GET /api/regions/:id/attractions` - Get attractions in region

### Hotel Endpoints
- `GET /api/hotels` - Get all hotels
- `GET /api/hotels/:id` - Get hotel details
- `POST /api/hotels` - Register hotel (user)
- `PUT /api/hotels/:id` - Update hotel (admin)
- `PATCH /api/hotels/:id/status` - Approve/reject hotel (admin)
- `DELETE /api/hotels/:id` - Delete hotel (admin)

### Petrol Pump Endpoints
- `GET /api/petrol-pumps` - Get all petrol pumps
- `GET /api/petrol-pumps/:id` - Get pump details
- `POST /api/petrol-pumps` - Register pump (user)
- `PUT /api/petrol-pumps/:id` - Update pump (admin)
- `PATCH /api/petrol-pumps/:id/status` - Approve/reject pump (admin)

### Hospital Endpoints
- `GET /api/hospitals` - Get all hospitals
- `GET /api/hospitals/:id` - Get hospital details
- `POST /api/hospitals` - Register hospital (user)
- `PUT /api/hospitals/:id` - Update hospital (admin)
- `PATCH /api/hospitals/:id/status` - Approve/reject hospital (admin)

### Weather Endpoints
- `GET /api/weather/:region` - Get weather for region
- `GET /api/weather/forecast/:region` - Get weather forecast

### Review Endpoints
- `GET /api/reviews/:type/:id` - Get reviews
- `POST /api/reviews` - Add review
- `PUT /api/reviews/:id` - Update review
- `DELETE /api/reviews/:id` - Delete review

---

## Setup Instructions

### Prerequisites
- Flutter SDK 3.x
- Dart SDK
- Android Studio / Xcode
- Git

### Installation Steps

1. **Clone the repository**
```bash
git clone <repository-url>
cd GDATourism
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Generate code**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Run the app**
```bash
flutter run
```

### Environment Variables
Create a `.env` file in the project root:
```
API_BASE_URL=https://api.gdatourism.com
GOOGLE_MAPS_API_KEY=your_api_key
WEATHER_API_KEY=your_api_key
FIREBASE_API_KEY=your_api_key
```

---

## Development Guidelines

### Code Style
- Follow Dart style guide
- Use meaningful variable names
- Add comments for complex logic
- Keep functions small and focused

### Git Workflow
- Create feature branches: `feature/feature-name`
- Commit messages: `type: description`
  - `feat: new feature`
  - `fix: bug fix`
  - `docs: documentation`
  - `refactor: code refactoring`
  - `test: adding tests`

### Testing
- Write unit tests for business logic
- Write widget tests for UI components
- Write integration tests for critical flows

### Performance
- Optimize image sizes
- Use lazy loading for lists
- Implement caching strategies
- Monitor app performance

---

## Contact

For questions or support, contact:
- Email: support@gdatourism.com
- Website: www.gdatourism.com
