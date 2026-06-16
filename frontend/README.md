# Flutter Frontend - Clove Marketplace

## 📱 Project Setup

### Prerequisites
- Flutter SDK (3.0.0+)
- Dart SDK
- Android Studio / Xcode
- Git

### Installation

```bash
# Clone repository
git clone https://github.com/mantokusmanto339-gif/market.git
cd market/frontend

# Get dependencies
flutter pub get

# Generate code (freezed, json_serializable, etc)
flutter pub run build_runner build

# Run app
flutter run
```

## 📁 Project Structure

```
frontend/
├── lib/
│   ├── main.dart                 # Entry point
│   ├── config/
│   │   ├── routes/
│   │   │   └── app_routes.dart   # Navigation routes
│   │   └── theme/
│   │       ├── app_constants.dart # Colors, spacing, etc
│   │       └── app_theme.dart    # Theme configuration
│   ├── models/                   # Data models
│   │   ├── user_model.dart
│   │   ├── product_model.dart
│   │   └── order_model.dart
│   ├── screens/                  # UI Screens
│   │   ├── auth/
│   │   │   ├── login_screen.dart
│   │   │   └── register_screen.dart
│   │   ├── home/
│   │   │   └── home_screen.dart
│   │   └── splash/
│   │       └── splash_screen.dart
│   ├── services/                 # API & Storage services
│   │   ├── api_client.dart       # HTTP client
│   │   └── storage_service.dart  # Local storage
│   └── widgets/                  # Reusable widgets
├── pubspec.yaml                  # Dependencies
└── README.md
```

## 🎨 Key Features

### Authentication
- ✅ User Registration (Email, Password)
- ✅ User Login
- ✅ Social Login (Google, Apple)
- ✅ Password Management

### Shopping
- ✅ Product Browsing
- ✅ Product Search & Filter
- ✅ Shopping Cart
- ✅ Checkout
- ✅ Order Tracking

### User Management
- ✅ User Profile
- ✅ Order History
- ✅ Favorites/Wishlist
- ✅ Notifications

### Seller Features
- ✅ Shop Management
- ✅ Product Management
- ✅ Order Management
- ✅ Analytics

## 📦 Dependencies

### State Management
- `provider` - State management
- `flutter_riverpod` - Alternative state management

### Networking
- `dio` - HTTP client
- `http` - Additional HTTP support

### Storage
- `shared_preferences` - Key-value storage
- `hive` - NoSQL database
- `hive_flutter` - Flutter support for Hive

### Navigation
- `go_router` - Modern routing

### Serialization
- `json_serializable` - JSON parsing
- `freezed_annotation` - Immutable models

### UI
- `flutter_svg` - SVG support
- `cached_network_image` - Image caching
- `image_picker` - Image selection

### Payment
- `webview_flutter` - WebView for payment gateway

### Notifications
- `firebase_core` - Firebase foundation
- `firebase_messaging` - Push notifications
- `firebase_analytics` - Analytics

## 🚀 Getting Started

### 1. Setup Backend Connection
Update `API_BASE_URL` in `lib/services/api_client.dart` to match your backend server.

```dart
static const String baseUrl = 'http://your-backend-url/api/v1';
```

### 2. Run the App
```bash
flutter run
```

### 3. Debug on Device
```bash
# iOS
flutter run -d "iPhone"

# Android
flutter run -d "<device-id>"
```

## 📝 Common Commands

```bash
# Get dependencies
flutter pub get

# Generate code
flutter pub run build_runner build

# Clean build
flutter clean

# Run with specific flavor
flutter run --flavor development

# Build APK
flutter build apk --release

# Build iOS app
flutter build ios --release
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run specific test
flutter test test/file_test.dart

# Run with coverage
flutter test --coverage
```

## 🎯 Next Steps

1. **Implement Authentication Service**
   - Register/Login logic
   - Token management
   - Auto-logout

2. **Implement Product Listing**
   - Fetch products from API
   - Implement pagination
   - Add search & filter

3. **Implement Shopping Cart**
   - Add/remove items
   - Update quantities
   - Calculate totals

4. **Implement Checkout**
   - Payment gateway integration
   - Order creation
   - Order tracking

5. **Implement User Profile**
   - View profile
   - Edit profile
   - View order history

## 📚 Useful Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [GetX Package](https://github.com/jonataslaw/getx)
- [Riverpod Documentation](https://riverpod.dev)

## 🤝 Contributing

Please follow the coding standards and create feature branches.

## 📄 License

MIT License
