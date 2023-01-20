import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0;
  double longitude = 0.0;
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location L = Location();
    await L.getCurrentLocation();
    latitude = L.latitude;
    longitude = L.longitude;
    print(L.latitude);
    print(L.longitude);
    networkHelper n = networkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=ffd01736ed4cef667531d32d202857d5&units=metric');
    var weatherData = await n.getData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationweather: weatherData,
          );
        },
      ),
    );
  }
  // void getCityWeather(String typeCity) async {
  //   networkHelper n = networkHelper(
  //       'https://api.openweathermap.org/data/2.5/weather?q=$typeCity&appid=ffd01736ed4cef667531d32d202857d5&units=metric');
  //   var weatherData = await n.getData();
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return LocationScreen(
  //           locationweather: weatherData,
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
