import 'package:flutter/cupertino.dart';
import 'package:geocoder/services/base.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class GetLocation{

  double latitude;
  double longitude;
  String city;

  Future<void> getCurrentLocaation() async {

    try{

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;

      city = await getCityName(position.latitude, position.longitude);

    }catch(e){
      print(e);
    }

  }

  Future<String> getCityName(double lat, double lon) async{

    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    return placemark[0].locality;

  }

}