import 'package:flutter/material.dart';
import 'package:weather_app/Activity/loading_page.dart';
import 'package:weather_icons/weather_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings?.arguments as Map;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(

        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(18),
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
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          String name = searchController.text.replaceAll(" ", "");
                          if (name != "") {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    LoadingPage(name),
                              ),
                            );
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Any City Name.."),
                          onTap: () {
                            String name = searchController.text.replaceAll(" ", "");
                            if (name != "") {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoadingPage(
                                      name),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        "https://openweathermap.org/img/wn/${data["icon_value"]}@2x.png",
                        width: 120,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${data["description_value"]}",
                            style:
                            const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),Text(
                            "In ${data["cityName"]}",
                            style:
                            const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "TEMPERATURE",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Icon(
                          WeatherIcons.thermometer,
                          size: 42,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data["temp_value"],
                              style: TextStyle(fontSize: 75),
                            ),
                            const Text(
                              "C",
                              style: TextStyle(fontSize: 40),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "AIR SPEED",
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          const Icon(
                            WeatherIcons.day_light_wind,
                            size: 30,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            data["airSpeed_value"],
                            style: const TextStyle(fontSize: 50),
                          ),
                          const Text(
                            "km/hr",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "HUMIDITY",
                              style: TextStyle(
                                  color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                            const Icon(
                              WeatherIcons.humidity,
                              size: 30,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              data["humidity_value"],
                              style: TextStyle(fontSize: 50),
                            ),
                            const Text(
                              "percent",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  "Made By Nilesh Morkar",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
