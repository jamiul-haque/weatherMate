import 'package:flutter/material.dart';
import 'package:weather_app/constant/constants.dart';
import '../widgets/weather_item.dart';
import 'welcome_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Scaffold(
      backgroundColor: myConstants.secondaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: myConstants.secondaryColor,
        elevation: 0.0,
        title: const Text("Location"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Welcome()));
              },
              icon: const Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: SizedBox(
              height: 150,
              width: size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      margin: const EdgeInsets.only(right: 20),
                      width: 80,
                      decoration: BoxDecoration(
                          color: const Color(0xff9ebcf9),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              blurRadius: 5,
                              color: Colors.blue.withOpacity(.3),
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '50',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Image.asset(
                            'assets/showers.png',
                            width: 30,
                          ),
                          Text(
                            'Sun',
                            style: TextStyle(
                              fontSize: 18,
                              color: myConstants.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: size.height * .55,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    right: 20,
                    left: 20,
                    child: Container(
                      width: size.width * .7,
                      height: 300,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.center,
                              colors: [
                                Color(0xffa9c1f5),
                                Color(0xff6696f5),
                              ]),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(.1),
                              offset: const Offset(0, 25),
                              blurRadius: 3,
                              spreadRadius: -10,
                            ),
                          ]),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -40,
                            left: 20,
                            child: Image.asset(
                              'assets/showers.png',
                              width: 150,
                            ),
                          ),
                          const Positioned(
                            top: 120,
                            left: 30,
                            child: Text(
                              "Static Name",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Container(
                              width: size.width * 0.8,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  weatherItem(
                                    text: 'Win Speed',
                                    value: 1.7,
                                    unit: 'km/h',
                                    imageUrl: 'assets/windspeed.png',
                                  ),
                                  weatherItem(
                                    text: 'Humidity',
                                    value: 50,
                                    unit: '',
                                    imageUrl: 'assets/humidity.png',
                                  ),
                                  weatherItem(
                                    text: 'Max-Temp',
                                    value: 50,
                                    unit: ' C',
                                    imageUrl: 'assets/max-temp.png',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: 20,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "30",
                                  style: TextStyle(
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader = linearGradient,
                                  ),
                                ),
                                Text(
                                  'o',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader = linearGradient,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 300,
                    left: 20,
                    child: SizedBox(
                      height: 200,
                      width: size.width * .9,
                      child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 5),
                              height: 80,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: myConstants.secondaryColor
                                          .withOpacity(.1),
                                      spreadRadius: 7,
                                      blurRadius: 20,
                                      offset: const Offset(0, 3),
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '9/13',
                                      style: TextStyle(
                                        color: Color(0xff6696f5),
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          '35', //max-tamp
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '/',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 30,
                                          ),
                                        ),
                                        Text(
                                          '20', //min-tamp
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/lightcloud.png',
                                          width: 30,
                                        ),
                                        const Text(
                                          'weather_state',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
