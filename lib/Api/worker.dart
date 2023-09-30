import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class worker {
  String location = "";

  worker({required this.location}) {
    location = this.location;
  }

  String temp = "";
  String humidity = "";
  String airSeed = "";
  String description = "";
  String main = "";
  String icon = "";
  String name = "";
  Future<void> getData() async {

    try {
// Define your RapidAPI key and API endpoint URL
      const apiKey = '27702d5d27msh98284803884f185p156085jsn9f40a7f2295a';
      const apiUrl = 'https://weatherapi-com.p.rapidapi.com/current.json'; // Replace with the API endpoint URL.

// Define the parameters you want to include
      final Map<String, String> queryParams = {
        'q': location,
        // Add other parameters as needed
      };

      final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

      final response = await http.get(
        uri,
        headers: {
          'X-RapidAPI-Key': apiKey,
        },
      );
      Map data = jsonDecode(response.body);




      /*Future<void> getData() async {
    try {
      final response = await http.get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=$location&APPID=9d886358e20b4d50a07c071bf6f2b860"));
      Map data = jsonDecode(response.body);
*/
      //temp
      Map temp_data = data["current"];
      double get_temp = temp_data['temp_c'] ;


      //name
      Map loction_data = data["location"];
      String get_name = loction_data["name"];


      //humidity
      String get_humidity = temp_data['humidity'].toString();

      //wind
      double getAirspeed = temp_data['wind_kph'];

      //description


      Map weather_main_data = temp_data['condition'];
      String get_main_des = weather_main_data['text'];

      String get_desc = weather_main_data['text'];

      String get_icon = weather_main_data['icon'];

//assigning value
      temp = (get_temp.toString());

      humidity = get_humidity;
      airSeed = getAirspeed.toString();
      description = get_desc;
      main = get_main_des;
      icon = get_icon;

      name = get_name;

    } catch (e) {
      temp = "NA";
      humidity = "NA";
      airSeed = "NA";
      description = "NA";
      main = "NA";
      icon = 'NA';
    }
  }
}
