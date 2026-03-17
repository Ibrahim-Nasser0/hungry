<div align="center">

# 🍔 Hungry
### E-Commerce Food Ordering App

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![BLoC](https://img.shields.io/badge/BLoC-State_Management-00B4D8?style=for-the-badge&logo=dart&logoColor=white)](https://bloclibrary.dev)
[![REST API](https://img.shields.io/badge/RESTful-API_Integration-FF6B35?style=for-the-badge&logo=fastapi&logoColor=white)]()
[![Clean Arch](https://img.shields.io/badge/Clean_Architecture-Feature_Driven-4CAF50?style=for-the-badge)]()

> A scalable cross-platform food e-commerce application built with **Feature-Driven Clean Architecture**, **BLoC** state management, and full **RESTful API** integration.

</div>

---

## ✨ Features

| Feature | Description |
|---|---|
| 🔐 **Full User Authentication** | Secure user registration and login flow |
| 🍽️ **Restaurant Browsing** | View a list of available restaurants and their detailed menus |
| 📡 **Dynamic Menu** | Fetches live menu data from a RESTful API |
| 🔍 **Search & Filtering** | Easily find specific restaurants or food items |
| 🛒 **Shopping Cart** | Add, remove, and manage items in your order before checkout |
| 📦 **Order Submission** | Place orders that are sent to the backend |
| 📋 **Order History** | View a list of your past orders and their statuses |
| 📱 **Responsive UI** | Adapts to various screen sizes for phones and tablets |

---

## 🏗️ Architecture

This project strictly follows **Feature-Driven Clean Architecture** to ensure a complete separation of concerns between application layers.

### Why Clean Architecture?

| Principle | Details |
|---|---|
| **Independent of UI** | Business logic has zero knowledge of what's shown on screen |
| **Independent of Frameworks** | Core logic is pure Dart — portable and reusable |
| **Independent of Data Sources** | Data layer can be swapped (REST API ↔ local DB) without touching core logic |
| **Highly Testable** | Each layer is independently unit-testable in isolation |

### Layer Diagram

```
┌──────────────────────────────────────────────────────────────────────┐
│                        PRESENTATION LAYER                            │
│                                                                      │
│    ┌─────────────┐      ┌────────────────┐      ┌────────────────┐   │
│    │  Pages &    │ ───▶ │   BLoC/Cubit   │ ───▶│    States &    │   │
│    │  Screens    │      │   + Events     │      │    Widgets     │   │
│    └─────────────┘      └───────┬────────┘      └────────────────┘   │
│                                 │                                    │
└─────────────────────────────────┼────────────────────────────────────┘
                                  │  calls
┌─────────────────────────────────▼────────────────────────────────────┐
│                           DOMAIN LAYER                               │
│                                                                      │
│    ┌─────────────┐      ┌────────────────┐      ┌────────────────┐   │
│    │  Entities   │      │   Use Cases    │      │  Repository    │   │
│    │  (Models)   │      │ (Business      │      │  Interfaces    │   │
│    │             │      │   Logic)       │      │ (Abstractions) │   │
│    └─────────────┘      └───────┬────────┘      └───────┬────────┘   │
│                                 │                       │            │
└─────────────────────────────────┼───────────────────────┼────────────┘
                                  │  implemented by       │
┌─────────────────────────────────▼───────────────────────▼────────────┐
│                           DATA LAYER                                 │
│                                                                      │
│    ┌─────────────┐      ┌────────────────┐      ┌────────────────┐   │
│    │   Models    │      │  Repositories  │      │  Data Sources  │   │
│    │  (fromJson/ │      │ (Impl. Domain  │      │ Remote (Dio)   │   │
│    │   toJson)   │      │  Interfaces)   │      │ Local (Cache)  │   │
│    └─────────────┘      └────────────────┘      └────────────────┘   │
│                                                                      │
└──────────────────────────────────────────────────────────────────────┘
```

### Data Flow

```
  User Action
      │
      ▼
  BLoC Event
      │
      ▼
  Use Case ──────── Domain Entity
      │
      ▼
  Repository Interface
      │
      ▼
  Repository Implementation
      │
      ▼
  Remote Data Source (Dio → REST API)
      │
      ▼
  JSON Model (fromJson)
      │
      ▼
  Domain Entity
      │
      ▼
  BLoC State ──────── UI Rebuild
```

---

## 🛠️ Tech Stack

### Core
| Technology | Role |
|---|---|
| **Flutter** | Cross-platform UI framework |
| **Dart** | Primary language |

### State Management
| Package | Usage |
|---|---|
| [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) | BLoC & Cubit for predictable state |

### Networking & API
| Package | Usage |
|---|---|
| [`dio`](https://pub.dev/packages/dio) | HTTP client with interceptors & error handling |

### Architecture & DI
| Package | Usage |
|---|---|
| [`get_it`](https://pub.dev/packages/get_it) | Service locator / Dependency Injection |

### Error Handling Strategy
```dart
// Three levels of error handling
enum Failure {
  networkFailure,    // No internet / timeout
  serverFailure,     // 4xx / 5xx responses
  unexpectedFailure  // Unknown / parsing errors
}
```

---

## 📁 Project Structure

```
lib/
│
├── core/
│   ├── errors/
│   │   ├── exceptions.dart            # Custom exception classes
│   │   └── failures.dart              # Failure sealed classes
│   ├── network/
│   │   ├── api_service.dart           # Dio client setup & interceptors
│   │   └── api_constants.dart         # Base URL & endpoint constants
│   ├── utils/
│   │   ├── app_colors.dart
│   │   └── app_text_styles.dart
│   ├── di/
│   │   └── service_locator.dart       # get_it registration
│   └── widgets/
│       └── nav_bar.dart               # Shared bottom navigation bar
│
├── features/
│   │
│   ├── auth/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── auth_remote_data_source.dart
│   │   │   ├── models/
│   │   │   │   └── user_model.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository.dart       # Abstract
│   │   │   └── usecases/
│   │   │       ├── login_usecase.dart
│   │   │       └── register_usecase.dart
│   │   └── presentation/
│   │       ├── view_model/
│   │       │   ├── auth_cubit.dart
│   │       │   └── auth_state.dart
│   │       └── views/
│   │           ├── widgets/                   # Ui Components
│   │           ├── login_screen.dart
│   │           └── register_screen.dart
│   │
│   ├── home/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── product/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── cart/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── checkout/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── order_history/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── profile/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
└── main.dart
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- Android Studio / VS Code

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/Ibrahim-nasser0/hungry.git

# 2. Navigate to the project
cd hungry

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter_bloc: ^9.1.1            # BLoC & Cubit state management
  dio: ^5.9.0                     # HTTP client with interceptors
  get_it: ^9.2.0                  # Dependency injection / service locator
  dartz: ^0.10.1                  # Functional error handling (Either)
  equatable: ^2.0.8               # Value equality for states & entities
  go_router: ^17.0.1              # Declarative routing & navigation
  cached_network_image: ^3.4.1    # Efficient image caching
  flutter_screenutil: ^5.9.3      # Responsive UI & adaptive sizing
  flutter_svg: ^2.2.1             # SVG asset rendering
  shared_preferences: ^2.5.3      # Lightweight local key-value storage
  meta: ^1.16.0                   # Dart annotations (immutable, etc.)
```

---

<div align="center">

Built with 💙 by [Ibrahim Nasser](https://github.com/Ibrahim-nasser0)

[![GitHub](https://img.shields.io/badge/GitHub-Ibrahim--nasser0-181717?style=for-the-badge&logo=github)](https://github.com/Ibrahim-nasser0)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Ibrahim_Nasser-0077B5?style=for-the-badge&logo=linkedin)](https://linkedin.com/in/ibrahim-Nasser-mobile)

</div>
