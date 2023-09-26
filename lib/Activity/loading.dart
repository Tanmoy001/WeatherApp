import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled/Api/worker.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String temperature = "";
  String hum = "";
  String air_speed = "";
  String des = "";
  String main = "";
  String icon = "";
  String name = "";
  String city = "Mumbai"; // Initialize with a default city
 // String previousCity = "Mumbai"; // Initialize with the same default city

  Future<void> startApp(String city) async {
    worker instance = worker(location: city);

     await instance.getData();

    temperature = instance.temp;
    hum = instance.humidity;
    air_speed = instance.airSeed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    name = instance.name;
    debugPrint("$temperature asdfsdf");
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "temp_value": temperature,
      "hum_value": hum,
      "air_speed_value": air_speed,
      "des_value": des,
      "main": main,
      "icon": icon,
      "name": name,
    });
  }


  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic>? search =
    ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;

    if (search?.isNotEmpty ?? false) {
     city = search?['searchText'] ?? 'Mumbai';
     // if (newCity != previousCity) {
      //  city = newCity;
     //   debugPrint("$city from city input");
     //   startApp(city);
      //  previousCity = newCity;
      //}
    }
    startApp(city);

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 150,),
            Image.asset("images/weathericon.png", height: 180, width: 180),
            const SizedBox(height: 8),
            const Text(
              "Weather ForeCast",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Made by Tanmoy",
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 18,
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
