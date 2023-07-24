import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Weather/weather.dart';

class LoadingPage extends StatefulWidget {
  String cityName = "";
  LoadingPage(this.cityName,{super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState(cityName);
}

class _LoadingPageState extends State<LoadingPage> {

  _LoadingPageState(this.cityName);
  String? cityName;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    Weather w1 = Weather(cityName!);
    await w1.setData();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "temp_value": w1.temp,
        "humidity_value": w1.humidity,
        "airSpeed_value": w1.airSpeed,
        "description_value": w1.description,
        "main_value": w1.main,
        "icon_value":w1.iconName,
        "cityName":cityName,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade50,
                Colors.blue.shade600,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 200,
                ),
                const SizedBox(height: 80),
                const Text(
                  "WeatherVibe",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "By Nilesh Morkar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 30),
                SpinKitThreeInOut(
                  color: Colors.yellow.shade200,
                  size: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
