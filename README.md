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
<img width="263" alt="Ekran Resmi 2024-12-03 18 25 44" src="https://github.com/user-attachments/assets/05cea3b7-c87a-49dc-98cb-a614b63fa7b1">
<img width="263" alt="Ekran Resmi 2024-12-03 18 25 58" src="https://github.com/user-attachments/assets/f73f5a65-9fd4-468e-9c8a-dd4d417c6a32">
<img width="263" alt="Ekran Resmi 2024-12-03 18 26 24" src="https://github.com/user-attachments/assets/9191dc39-a6a1-49b8-895a-41ad804e0662">
<img width="263" alt="Ekran Resmi 2024-12-03 18 26 47" src="https://github.com/user-attachments/assets/4fe41dec-345c-46f4-8ec4-d4404ae63280">
<img width="263" alt="Ekran Resmi 2024-12-03 18 28 03" src="https://github.com/user-attachments/assets/7d3626ba-291e-4ebf-8b10-e2fa6db9783b">
<img width="263" alt="Ekran Resmi 2024-12-03 18 28 28" src="https://github.com/user-attachments/assets/6dc7c0c4-0af0-4060-8831-c86e9b5c82a5">
<img width="263" alt="Ekran Resmi 2024-12-03 18 28 53" src="https://github.com/user-attachments/assets/47891ae2-0c09-4f49-b7ab-3a8f12c14566">
<img width="263" alt="Ekran Resmi 2024-12-03 18 29 13" src="https://github.com/user-attachments/assets/4bcf2442-5ec9-4afc-8f71-0a36bb268900">
<img width="263" alt="Ekran Resmi 2024-12-03 18 29 28" src="https://github.com/user-attachments/assets/4998caff-1a92-4bf7-9481-36b9ae8079b8">
<img width="262" alt="Ekran Resmi 2024-12-15 21 05 08" src="https://github.com/user-attachments/assets/f41d192c-1b7f-4359-b473-2b2ba53733b7" />
<img width="262" alt="Ekran Resmi 2024-12-15 21 05 32" src="https://github.com/user-attachments/assets/867b8d6e-c872-472b-8249-36ad68fafa0e" />
<img width="262" alt="Ekran Resmi 2024-12-15 21 06 31" src="https://github.com/user-attachments/assets/7256a2d5-6ac7-4d2d-90c5-94900c5c51d2" />



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
│   │   └── provider/ 
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

## 📱 Demo Video
https://github.com/user-attachments/assets/f9ee35c4-5d05-47eb-b176-db818c977e99



