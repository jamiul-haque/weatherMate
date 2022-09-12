import 'package:flutter/material.dart';
import 'package:weather_app/models/constants.dart';
import 'package:weather_app/page/city.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    List<City> cityes =
        City.citysList.where((city) => city.isDefault == false).toList();
    List<City> selectedcityes = City.getSelectedCityes();

    Constants myConstants = Constants();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: myConstants.secondaryColor,
        title: Text('${selectedcityes.length} selected'),
        // title: Text(selectedcityes.length.toString() + ' selected'),
      ),
      body: ListView.builder(
          itemCount: cityes.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: size.height * 0.08,
              width: size.width,
              decoration: BoxDecoration(
                  border: cityes[index].isSelected == true
                      ? Border.all(
                          color: myConstants.secondaryColor.withOpacity(.6),
                          width: 2)
                      : Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: myConstants.primaryColor.withOpacity(.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        cityes[index].isSelected = !cityes[index].isSelected;
                      });
                    },
                    child: Image.asset(
                      cityes[index].isSelected == true
                          ? 'assets/checked.png'
                          : 'assets/unchecked.png',
                      width: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    cityes[index].city,
                    style: TextStyle(
                      fontSize: 16,
                      color: cityes[index].isSelected == true
                          ? myConstants.primaryColor
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myConstants.secondaryColor,
        child: const Icon(Icons.pin_drop),
        onPressed: () {
          print(cityes);
        },
      ),
    );
  }
}
