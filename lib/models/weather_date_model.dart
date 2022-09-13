class WeatherDataModel {
  final int id;
  final String title;
  final String description;
  final String icondata;
  final double temp;

  WeatherDataModel({
    required this.id,
    required this.title,
    required this.description,
    required this.temp,
    required this.icondata,
  });

  factory WeatherDataModel.fromMap(Map<String, dynamic> json) {
    final data = json['main'];
    return WeatherDataModel(
      id: json['weather'][0]['id'],
      title: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      icondata: json['weather'][0]['icon'],
      temp: data['temp'],
    );
  }
}
