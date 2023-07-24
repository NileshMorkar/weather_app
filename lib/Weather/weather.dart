import 'package:http/http.dart';
import 'dart:convert';

class Weather {
  Weather(String name) {
    location = name;
  }

  String? location;
  String? temp;
  String? humidity;
  String? airSpeed;
  String? description;
  String? main;
  String? iconName;

  Future<void> setData() async {
    try {
      String url =
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=cc398c8ab65466335149c24a4a728fa7";

      Response response = await get(Uri.parse(url));

      Map data = jsonDecode(response.body);

      temp = (data["main"]["temp"]-273.15).toString().substring(0,4);
      airSpeed = (data["wind"]["speed"] * 18/5.0).toString().substring(0,4);
      humidity = data["main"]["humidity"].toString();
      description = data["weather"][0]["description"];
      main = data["weather"][0]["main"];
      iconName = data["weather"][0]["icon"];
    } catch (error) {
      temp = "NA";
      humidity = "NA";
      airSpeed = "NA";
      description = "No results found!";
      main = "NA";
      iconName = "09d";
    }
  }
}
