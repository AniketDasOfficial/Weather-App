import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'GetLocation.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {

    getLocation();

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              child: displayImage(),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                'You Are In: ',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: <Widget>[
                  Container(
                      child: Text(
                    "Kolkata",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[500]),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 30,
                  )),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 17,
                horizontal: 25,
              ),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.wb_sunny,
                  color: Colors.amber,
                ),
                title: Text('Temp: 25C'),
              ),
            ),
          ],
        ),
      ),
    );
  }

//  Display image based on Time

  displayImage() {
    var now = DateTime.now();
    final currentTime = DateFormat.jm().format(now);

    if (currentTime.contains('AM')) {
      // print('Current Time is: $currentTime');
      return Image.asset('images/daytime.jpg');
    } else if (currentTime.contains('PM')) {
      // print('Current Time is: $currentTime');
      return Image.asset('images/nightTime.jpg');
    }
  }

//  Get Location
  void getLocation() async{

    GetLocation getLocation = new GetLocation();
    await getLocation.getCurrentLocaation();

    print("Latitude: ${getLocation.latitude} \nLongitude: ${getLocation.longitude} \nCity: ${getLocation.city}");

  }

//  Get current Temperature

  Future<void> getTemp() async{

    http.Response response = await http.get('api.openweathermap.org/data/2.5/weather?lat=35&lon=139');

  }

}
