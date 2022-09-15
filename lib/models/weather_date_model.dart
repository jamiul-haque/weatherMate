class WeatherDataModel {
  final int id;
  final String title;
  final String description;
  final String icondata;
  final double temp;
  final double temp_min;
  final double temp_max;
  final int humidity;
  final double windspeed;

  WeatherDataModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.temp,
      required this.icondata,
      required this.temp_min,
      required this.temp_max,
      required this.humidity,
      required this.windspeed});

  factory WeatherDataModel.fromMap(Map<String, dynamic> json) {
    final data = json['main'];
    final data1 = json['wind'];
    return WeatherDataModel(
      id: json['weather'][0]['id'],
      title: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      icondata: json['weather'][0]['icon'],
      temp: data['temp'],
      temp_min: data['temp_min'],
      temp_max: data['temp_max'],
      humidity: data['humidity'],
      windspeed: data1['speed'],
    );
  }
}
