import '../screens/location_screen.dart';
import 'package:weather_app/services/location.dart';
import 'networking.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String typeCity) async {
    networkHelper n = networkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=ffd01736ed4cef667531d32d202857d5&units=metric');
    var weatherData = await n.getData();
     return weatherData;
  }
  Future<dynamic> getLocationWeather()async{
    Location L = Location();
    await L.getCurrentLocation();
    print(L.latitude);
    print(L.longitude);
    networkHelper n = networkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${L.latitude}&lon=${L.longitude}&appid=ffd01736ed4cef667531d32d202857d5&units=metric');
    var weatherData = await n.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp >= 40) {
      return 'Its Very Hot';
    }else if (temp <40 && temp>=30) {
      return 'Its Hot weahter';
    } else if (temp <30 && temp>=20) {
      return 'Normal weahter';
    } else if (temp <20 && temp>=10) {
      return 'Cold weather';
    } else if (temp <10 && temp>=0) {
      return 'Very Cold weather';
    } else if (temp<0) {
      return 'Freezing weather';
    } else {
      return '👻';
    }
  }
}