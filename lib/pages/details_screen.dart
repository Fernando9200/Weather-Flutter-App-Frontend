import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailsScreen extends StatefulWidget {
  final String city;

  const DetailsScreen({super.key, required this.city});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Map<String, dynamic>? weatherData;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  fetchWeather() async {
    var url = Uri.parse('https://weather-flutter-app-backend.onrender.com/weather?city=${widget.city}');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          weatherData = json.decode(response.body);
          errorMessage = null;
        });
      } else {
        setState(() {
          errorMessage = "City not found. Please enter a valid city name.";
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  String? getWeatherIconUrl() {
    if (weatherData != null && weatherData!['weather'].isNotEmpty) {
      String iconCode = weatherData!['weather'][0]['icon'];
      return 'http://openweathermap.org/img/wn/${iconCode}@4x.png';
    }
    return null;
  }

  Widget weatherDetailCard(String title, String value, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      elevation: 4,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blueAccent,
        ),
        title: Text(title),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String? iconUrl = getWeatherIconUrl();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: weatherData != null
            ? SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 20),
                        if (iconUrl != null)
                          Image.network(iconUrl, width: 150, height: 200, fit: BoxFit.contain),
                        weatherDetailCard('Temperature', '${weatherData!['main']['temp']}°F', Icons.thermostat),
                        weatherDetailCard('Condition', '${weatherData!['weather'][0]['main']}', Icons.cloud),
                        weatherDetailCard('Humidity', '${weatherData!['main']['humidity']}%', Icons.opacity),
                        weatherDetailCard('Location', '${weatherData!['name']}, ${weatherData!['sys']['country']}', Icons.location_on),
                        const Spacer(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              )
            : Center(
          child: errorMessage != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.redAccent,
                      size: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      errorMessage!,
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                ),
        ),
      ),
    );
  }
}