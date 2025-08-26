# MB Challenge - Exchanges App

This Flutter project displays information about cryptocurrency exchanges and their associated coins. The app was built using **Flutter**, **Bloc/Cubit** for state management, and **Dio** for HTTP requests.

## Features

- List exchanges with logo, name, volume, and launch date.
- View exchange details, including:
  - ID
  - Description
  - Website
  - Maker Fee
  - Taker Fee
  - Date Launched
  - Spot Volume USD
  - Weekly Visits
  - Associated coins with name and price
- Smooth navigation from exchange list to detail page.
- Handles large amounts of coins efficiently using `ListView.builder`.

## Technical Notes

- **Custom HTTP Client**: Implemented using Dio to centralize API configuration, including API key and base URL.
- **Models**: The `ExchangeModel` formats the launch date (`dateLaunched`) as `DateTime` for better display.
- **State Management**: Used `Bloc/Cubit` to manage API calls and state.

### API Limitations

The API endpoint used to fetch exchanges only allows fetching **one exchange at a time** per request. To work around this limitation and display multiple exchanges on the main page, a workaround was implemented: fetching at least 4 exchanges individually by their IDs and displaying them in the list.

## Getting Started

1. Install dependencies:
```bash
flutter pub get
```

2. Run the app:
```bash
flutter run
```

## Screenshots


