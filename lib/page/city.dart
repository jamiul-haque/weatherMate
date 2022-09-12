class City {
  bool isSelected;
  final String city;
  final String country;
  final bool isDefault;
  City(
      {required this.isSelected,
      required this.city,
      required this.country,
      required this.isDefault});

  // List of citys data

  static List<City> citysList = [
    City(isSelected: false, city: 'London', country: 'UK', isDefault: true),
    City(isSelected: false, city: 'Tokyo', country: 'Japan', isDefault: false),
    City(
        isSelected: false, city: 'Beijing', country: 'China', isDefault: false),
    City(isSelected: false, city: 'Rome', country: 'Italy', isDefault: false),
    City(
        isSelected: false,
        city: 'Dhaka',
        country: 'Bangladesh',
        isDefault: false),
    City(isSelected: false, city: 'Delhi', country: 'India', isDefault: false),
    City(
        isSelected: false,
        city: 'Kathmandu',
        country: 'Nepal',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Thimphu',
        country: 'Bhutan',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Bangkok',
        country: 'Thiland',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Kuala Lumpur',
        country: 'Malaysia',
        isDefault: false),
  ];
  // get the selected cityes
  
  static List<City> getSelectedCityes() {
    List<City> selectedCityes = City.citysList;
    return selectedCityes.where((city) => city.isSelected == true).toList();
  }
}
