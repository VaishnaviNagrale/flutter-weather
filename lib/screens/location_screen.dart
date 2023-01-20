import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utilities/constants.dart';

WeatherModel weather = WeatherModel();
int tempi=0;
String weatherIcon='';
String cityName='';
String weatherMessage='';
var weatherData;
class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationweather);
  }
  void updateUI(dynamic weatherData){
     if(weatherData==null){
       tempi=0;
       weatherIcon='Error';
       weatherMessage='Unable to get the weather data';
       cityName='';
       return;
     }
     double temp=weatherData["main"]["temp"];
     tempi=temp.toInt();
     var condition=weatherData["weather"][0]["id"];
     weatherIcon = weather.getWeatherIcon(condition);
     weatherMessage=weather.getMessage(tempi);
     cityName=weatherData["name"];
     print(condition);
     print(weatherIcon);
     print(weatherMessage);
     print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      // var weatherData=await weather.getLocationWeather();
                      // updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.green,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typeName = await Navigator.push(context, MaterialPageRoute(builder: (context)=>CityScreen(),),);
                       if(typeName!=null) {
                         var weatherData = await weather.getCityWeather(typeName);
                         updateUI(weatherData);
                         print(typeName);
                       }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$tempi ',
                      style: kTempTextStyle,
                    ),
                    Text(
                     '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                 '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}