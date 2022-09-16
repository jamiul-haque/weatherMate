import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_app/constant/constants.dart';
import 'package:weather_app/models/weather_date_model.dart';
import 'package:weather_app/page/city.dart';
import 'package:weather_app/service/api_service.dart';
import '../constant/common_content.dart';
import '../widgets/weather_item.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  List<String> cityList;
  HomePage({Key? key, required this.cityList}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
// shader linear gradient

final Shader linearGradient = const LinearGradient(
  colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
final random = Random();

class _HomePageState extends State<HomePage> {
  Constants myConstants = Constants();
  // initiatilization
  String imageUrl = '';
  String location = '';
  Map locationLat = {};

  var selectedCityes = City.getSelectedCityes();

  @override
  void initState() {
    location = widget.cityList[0];
    locationLat = commonContent(location);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: myConstants.primaryColor,
                ),
              ),
              // dropdown
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/pin.png',
                    width: 20,
                  ),
                  const SizedBox(width: 4),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: location,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: widget.cityList.map((String location) {
                          return DropdownMenuItem(
                              value: location, child: Text(location));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            locationLat = commonContent(newValue!);
                            print(locationLat);
                            location = newValue;
                          });
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: futureData(),
      ),
    );
  }

  Widget futureData() {
    print(locationLat);
    return FutureBuilder<WeatherDataModel?>(
        future: ApiService().getCurrentWeather(
            lat: locationLat['lat'], lon: locationLat['lon']),
        builder: (context, AsyncSnapshot<WeatherDataModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Text('Have some problem');
          }
          if (snapshot.data == null) {
            return const Text('No data');
          }
          WeatherDataModel weatherDataModel = snapshot.data!;
          return view(weatherDataModel);
        });
  }

  Widget view(WeatherDataModel model) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            model.description,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 50),
          Container(
            width: size.width,
            height: 200,
            decoration: BoxDecoration(
              color: myConstants.primaryColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: myConstants.primaryColor.withOpacity(.5),
                  offset: const Offset(0, 25),
                  blurRadius: 10,
                  spreadRadius: -12,
                ),
              ],
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -40,
                  left: 20,
                  child: Image.asset(
                    getWeatherIcon(iconValue: model.icondata),
                    width: 150,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  child: Text(
                    model.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          (model.temp - 273.15).toStringAsFixed(0),
                          // "${(model.temp - 273.15).toStringAsFixed(0)}",
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = linearGradient,
                          ),
                        ),
                      ),
                      Text(
                        'o',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                weatherItem(
                  text: 'Win Speed',
                  value: model.windspeed,
                  unit: ' km/h',
                  imageUrl: 'assets/windspeed.png',
                ),
                weatherItem(
                  text: 'Humidity',
                  value: model.humidity.toDouble(),
                  unit: '',
                  imageUrl: 'assets/humidity.png',
                ),
                weatherItem(
                  text: 'Max-Temp',
                  value: (model.temp_max - 273.15).roundToDouble(),
                  unit: ' C',
                  imageUrl: 'assets/max-temp.png',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Today',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'Next 7 Days',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: myConstants.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    address: location,
                                  )));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      margin:
                          const EdgeInsets.only(right: 20, bottom: 10, top: 10),
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              blurRadius: 5,
                              color: Colors.black54.withOpacity(.2),
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${(random.nextInt(30) + 15).toString()}" ' C',
                            style: TextStyle(
                                color: myConstants.primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          Image.asset(
                            'assets/thunderstorm.png',
                            width: 30,
                          ),
                          Text(
                            getDayName(value: index),
                            style: TextStyle(
                              fontSize: 18,
                              color: myConstants.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
