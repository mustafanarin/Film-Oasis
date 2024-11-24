# 🎬 Film Oasis - Flutter Movie App

Film Oasis is a modern Flutter application that provides users with a seamless movie browsing experience using The Movie Database (TMDB) API. The app offers a clean interface to discover new movies, search for specific titles, and manage favorites with dark theme support and Turkish localization.

## ✨ Features

- **Now Showing Movies**: Browse currently showing movies with IMDb ratings
- **Popular Movies**: Discover trending and popular movies
- **Search Functionality**: Find specific movies quickly and easily
- **Favorites System**: Save and manage your favorite movies
- **Theme Support**: Toggle between light and dark themes
- **Localization**: Supports Turkish language
- **Offline Support**: Cache system for better performance
- **Responsive Design**: Works seamlessly across different screen sizes

## 📱 Screenshots
<img width="323" alt="Ekran Resmi 2024-11-24 17 26 56" src="https://github.com/user-attachments/assets/d551e611-9fef-4c0a-8311-e657f27a1343">
<img width="323" alt="Ekran Resmi 2024-11-24 17 27 35" src="https://github.com/user-attachments/assets/ecf2226a-e741-4b0a-846c-d19df2a4a404">
<img width="323" alt="Ekran Resmi 2024-11-24 17 43 28" src="https://github.com/user-attachments/assets/619c3a28-7b48-4c3c-92c0-37cc207bca30">
<img width="323" alt="Ekran Resmi 2024-11-24 17 29 16" src="https://github.com/user-attachments/assets/71fd4748-4fbb-4d8e-96f5-6b6ea76ee0d5">
<img width="323" alt="Ekran Resmi 2024-11-24 17 30 55" src="https://github.com/user-attachments/assets/249f26ee-39b7-43be-97cd-beae0761ffd0">
<img width="323" alt="Ekran Resmi 2024-11-24 17 31 18" src="https://github.com/user-attachments/assets/146037ac-50ab-4ddb-aed9-4ccdaca79f8d">
<img width="323" alt="Ekran Resmi 2024-11-24 17 31 57" src="https://github.com/user-attachments/assets/5d516754-48fb-4aef-b6fb-a41803069fe1">
<img width="323" alt="Ekran Resmi 2024-11-24 17 32 24" src="https://github.com/user-attachments/assets/deb19767-1655-4e5b-bb12-dfba23269cb7">
<img width="323" alt="Ekran Resmi 2024-11-24 17 32 40" src="https://github.com/user-attachments/assets/dea79ed7-1894-4637-88db-2a286d28813b">



## 🛠️ Tech Stack & Architecture

### State Management
- flutter_riverpod: ^2.5.1
- flutter_hooks: ^0.20.5

### Networking & API
- dio: ^5.7.0
- TMDB API Integration

### Navigation
- auto_route: ^9.2.2

### Local Storage & Caching
- hive: ^2.2.3
- hive_flutter: ^1.1.0
- cached_network_image: ^3.4.1
- flutter_cache_manager: ^3.4.1

### Localization
- easy_localization: ^3.0.7
- intl: ^0.19.0

### Development Tools
- very_good_analysis: ^6.0.0
- build_runner: ^2.4.13
- flutter_lints: ^4.0.0

## 🚀 Getting Started

### Prerequisites
- Flutter SDK ^3.5.3
- Dart SDK ^3.5.3
- TMDB API Key

### Installation

1. Clone the repository
```bash
git clone https://github.com/mustafanarin/Film-Oasis.git
```

2. Navigate to project directory
```bash
cd film_oasis
```

3. Install dependencies
```bash
flutter pub get
```

4. Create a `.env` file in the root directory and add your TMDB API key:
```env
API_BASE_URL=https://api.themoviedb.org/3
API_KEY=your_api_key_here
```

5. Run the app
```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── feature/
│   ├── favorite/
│   │   ├── page/
│   │   ├── provider/
│   │   └── state/
│   ├── home/
│   │   ├── model/
│   │   ├── page/
│   │   │   ├── detail/
│   │   │   ├── home/
│   │   │   └── see_more/
│   │   ├── provider/
│   │   └── state/
│   ├── search/
│   │   ├── model/
│   │   ├── page/
│   │   ├── provider/
│   │   └── state/
│   ├── splash/
│   └── tabbar/
├── product/
│   ├── cache/
│   ├── constants/
│   ├── core/
│   ├── extensions/
│   ├── navigate/
│   ├── provider/
│   ├── theme/
│   ├── utility/
│   └── widgets/
├── service/
└── main.dart
```
