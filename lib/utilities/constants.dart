import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 80.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 35.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
  color: Colors.yellow,
);
const kInputdecoration=InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city,color: Colors.white,),
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  hintText: 'Enter city name',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0),),
    borderSide: BorderSide.none,
  ),
);
//(16582): {"coord":{"lon":30,"lat":30},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"base":"stations","main":{"temp":288.01,"feels_like":286.54,"temp_min":288.01,"temp_max":288.01,"pressure":1023,"humidity":38,"sea_level":1023,"grnd_level":1007},"visibility":10000,"wind":{"speed":3.67,"deg":25,"gust":3.71},"clouds":{"all":0},"dt":1674064518,"sys":{"country":"EG","sunrise":1674017763,"sunset":1674055443},"timezone":7200,"id":353223,"name":"Madīnat as Sādāt","cod":200}
//{key:value} lon==key && 30==value