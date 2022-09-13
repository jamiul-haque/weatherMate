import 'package:flutter/material.dart';
import 'package:weather_app/constant/constants.dart';
import 'package:weather_app/models/weather_date_model.dart';
import 'package:weather_app/page/city.dart';
import 'package:weather_app/service/api_service.dart';

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

class _HomePageState extends State<HomePage> {
  Constants myConstants = Constants();
  // initiatilization
  String imageUrl = '';
  String location = '';

  var selectedCityes = City.getSelectedCityes();

  @override
  void initState() {
    location = widget.cityList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
                            location = newValue!;
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
    return FutureBuilder<WeatherDataModel?>(
        future: ApiService().getCurrentWeather(lat: 44.34, lon: 10.99),
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
          const Text(
            "This is description",
            style: TextStyle(
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
                    'assets/clear.png',
                    width: 150,
                  ),
                ),
                const Positioned(
                  bottom: 30,
                  left: 20,
                  child: Text(
                    "WeatherStateName",
                    style: TextStyle(
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
                          '40',
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
                weatherItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class weatherItem extends StatelessWidget {
  const weatherItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'wind Speed',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(20),
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            color: Color(0xffE0E8FB),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Image.asset('assets/windspeed.png'),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          '1.7 kmh',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
