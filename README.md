# 🍔 Hungry App - Food Ordering Application

A full-featured food ordering application built with Flutter. This project is focused on creating a scalable and maintainable codebase by implementing **Clean Architecture**, while providing a seamless and responsive user experience for both iOS and Android.

---

## 📸 Screenshots & Demo

**_Note: This is the most important part of the README. Please replace the placeholders below with actual GIFs or screenshots of your application._**

| Login Screen | Home Screen | Restaurant Details |
| :---: | :---: | :---: |
| <img src="URL_TO_YOUR_SCREENSHOT_HERE" width="250"> | <img src="URL_TO_YOUR_SCREENSHOT_HERE" width="250"> | <img src="URL_TO_YOUR_SCREENSHOT_HERE" width="250"> |

| Cart | Search & Filter | Order History |
| :---: | :---: | :---: |
| <img src="URL_TO_YOUR_SCREENSHOT_HERE" width="250"> | <img src="URL_TO_YOUR_SCREENSHOT_HERE" width="250"> | <img src="URL_TO_YOUR_SCREENSHOT_HERE" width="250"> |

---

## ✨ Features

- **Full User Authentication:** Secure user registration and login flow.
- **Restaurant Browsing:** View a list of available restaurants and their detailed menus.
- **Dynamic Menu:** Fetches live menu data from a RESTful API.
- **Search & Filtering:** Easily find specific restaurants or food items.
- **Shopping Cart:** Add, remove, and manage items in your order before checkout.
- **Order Submission:** Place orders that are sent to the backend.
- **Order History:** View a list of your past orders and their statuses.
- **Responsive UI:** Adapts to various screen sizes for a consistent experience on phones and tablets.

---

## 🏗️ Architecture

This project follows the principles of **Clean Architecture** to create a strict separation of concerns between the layers of the application. This makes the codebase:
- **Independent of UI:** The business logic doesn't know anything about what's shown on the screen.
- **Independent of Frameworks:** The core logic is pure Dart and can be reused.
- **Independent of Data Sources:** The data layer can be easily swapped (e.g., from a REST API to a local database) without affecting the core logic.
- **Highly Testable:** Each layer can be unit-tested in isolation.

The main layers implemented are:
1.  **Domain:** Contains the core business logic, use cases, and entities. It has no dependencies on other layers.
2.  **Data:** Implements the repositories defined in the Domain layer and handles data retrieval from sources like REST APIs.
3.  **Presentation (UI):** The Flutter widgets and screens. This layer uses the **BLoC pattern** for robust and predictable state management.

---

## 🛠️ Tech Stack & Tools

- **Core:** Flutter & Dart
- **State Management:** BLoC (Business Logic Component)
- **Architecture:** Clean Architecture, Repository Pattern
- **API Integration:** RESTful APIs (using `dio` / `http`)
- **Dependency Injection:** `get_it`

---

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- You need to have the Flutter SDK installed on your machine. For help, check the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation

1.  Clone the repository:
    ```sh
    git clone [https://github.com/Ibrahim-Nasser0/hungry.git](https://github.com/Ibrahim-Nasser0/hungry.git)
    ```
2.  Navigate to the project directory:
    ```sh
    cd hungry
    ```
3.  Install the required dependencies:
    ```sh
    flutter pub get
    ```
4.  Run the application:
    ```sh
    flutter run
    ```
---

### 📫 Contact

Ibrahim Nasser - [LinkedIn](https://www.linkedin.com/in/ibrahim-nasser-mobile)
