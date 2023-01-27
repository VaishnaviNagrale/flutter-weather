import 'package:geolocator/geolocator.dart';

class Location{
  double latitude=0.0;
  double longitude=0.0;
  Future<void> getCurrentLocation() async {
     //Permission
     LocationPermission permission = await Geolocator.checkPermission();
     if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
       print('permission given to access your location');
       LocationPermission assked = await Geolocator.requestPermission();
     }
     else{
       Position currentposition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
       latitude = currentposition.latitude;
       longitude  = currentposition.longitude;
     }
   }
}
// double tempi=jsonDecode(data)["main"]["temp"];
// int condition=jsonDecode(data)["weather"][0]["id"];
// String city=jsonDecode(data)["name"];