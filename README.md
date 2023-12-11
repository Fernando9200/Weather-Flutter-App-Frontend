# Weather Flutter App Frontend

This repository contains the frontend code of a weather application built using Flutter. The app allows users to search for weather information by city and displays relevant data fetched from the backend Node.js server.

## Overview

The app has a simple and user-friendly interface, allowing users to enter a city name and view the current weather conditions for that location. The app interacts with the backend server to retrieve weather data.

### Features

- Search weather data by city name.
- Display weather details like temperature, condition, humidity, and location.
- Error handling for city not found or server errors.

## Getting Started

### Prerequisites

- Flutter environment set up on your machine.
- Backend server running (refer to the backend repository for setup).

### Installation

1. Clone the repository:
```bash
git clone https://github.com/Fernando9200/Weather-Flutter-App-Frontend.git
```
2. Navigate to the project directory:
```bash
cd [project-directory]
```
3. Get the dependencies:
```bash
flutter pub get
```
### Running the Application

1. Ensure the backend server is running (default: `http://localhost:3000`).

2. Start the Flutter app:
```bash
flutter run
```
3. Open a simulator or connect a device to run the app.

### Using the Application

- On the main screen, enter a city name in the search field.
- Press the 'Get Weather' button to view the weather details of the entered city.

## Note

This frontend application is designed to work in conjunction with the provided Node.js backend. Make sure that the backend is properly set up and running before using the Flutter app.

## Contributing

Contributions to enhance the app or its integration with the backend are welcome. Please feel free to submit pull requests or create issues for any bugs or feature requests.
