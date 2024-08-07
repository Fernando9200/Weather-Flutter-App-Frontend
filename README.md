# Weather Flutter App Frontend

This repository contains the frontend code of a weather application built using Flutter. The app allows users to search for weather information by city and displays relevant data fetched from the backend Node.js server.

## Overview

The app has a simple and user-friendly interface, allowing users to enter a city name and view the current weather conditions for that location. The app interacts with the backend server to retrieve weather data.

## Screen Captures
Below are some screenshots of the app running on an emulator to give you a preview of the user interface:  
<div style="display: flex; justify-content: space-around; flex-wrap: wrap;">
    <img src="https://github.com/user-attachments/assets/4eb7a4d4-9797-4275-ac87-46316c086897" alt="screenshot" width="190px" style="margin: 10px;">
    <img src="https://github.com/user-attachments/assets/057f69ec-9ef3-4e05-8b13-11a64d62ad9a" alt="screenshot" width="190px" style="margin: 10px;">
    <img src="https://github.com/user-attachments/assets/5a5f7168-a3f5-445d-b774-8fd8895dc2a3" alt="screenshot" width="190px" style="margin: 10px;">
    <img src="https://github.com/user-attachments/assets/21544dbe-91ca-4489-8640-89d7ce3e3d6c" alt="screenshot" width="190px" style="margin: 10px;">
    <img src="https://github.com/user-attachments/assets/aa7cb484-12a9-4edb-bbcd-3c14a40d6554" alt="screenshot" width="190px" style="margin: 10px;">
</div>




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
### Launching the Application and Connecting to a Local Backend Server

To set up and run your application with a local backend:

1. Find the local IP address of your machine (for example, `192.168.x.x`) and use this IP in your Flutter app to make requests (e.g., `http://192.168.x.x:3000/weather`). Also, ensure the backend server is running.

2. In the details_screen.dart file of the Flutter project, modify the URL in the network request and change `var url = Uri.parse('https://weather-flutter-app-backend.onrender.com/weather?city=${widget.city}');` to `var url = Uri.parse('http://192.168.x.x:3000/weather?city=${widget.city}');` replacing `192.168.x.x` with your actual local IP address.

3. If you prefer not to run the backend locally, you can continue using the deployed version available at `https://weather-flutter-app-backend.onrender.com`.

4. Start the Flutter app:
```bash
flutter run
```
5. Open a simulator or connect a device to run the app.

### Using the Application

- On the main screen, enter a city name in the search field.
- Press the 'Get Weather' button to view the weather details of the entered city.

## Note

This frontend application is designed to work in conjunction with the provided Node.js backend. Make sure that the backend is properly set up and running before using the Flutter app.

## Contributing

Contributions to enhance the app or its integration with the backend are welcome. Please feel free to submit pull requests or create issues for any bugs or feature requests.
