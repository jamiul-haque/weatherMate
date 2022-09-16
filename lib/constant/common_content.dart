Map commonContent(String cityName) {
  switch (cityName) {
    case 'London':
      {
        return {"lat": 0.1276, "lon": 51.5072};
      }

    case 'Dhaka':
      {
        return {"lat": 23.8103, "lon": 90.4125};
      }
    case 'Tokyo':
      {
        return {"lat": 35.6762, "lon": 139.6503};
      }
    case 'Beijing':
      {
        return {"lat": 39.9042, "lon": 116.4074};
      }
    case 'Rome':
      {
        return {"lat": 41.9028, "lon": 12.4964};
      }
    case 'Delhi':
      {
        return {"lat": 28.7041, "lon": 77.1025};
      }
    case 'Kathmandu':
      {
        return {"lat": 27.7172, "lon": 85.3240};
      }
    case 'Thimphu':
      {
        return {"lat": 27.4712, "lon": 89.6339};
      }
    case 'Bangkok':
      {
        return {"lat": 13.7563, "lon": 100.5018};
      }
    case 'Kuala Lumpur':
      {
        return {"lat": 3.1569, "lon": 101.7123};
      }

    default:
      {
        return {};
      }
  }
}

String getWeatherIcon({required String iconValue}) {
  switch (iconValue) {
    case '02d':
      {
        return "assets/heavycloud.png";
      }
    case '10d':
      {
        return "assets/heavyrain.png";
      }
    case '01d':
      {
        return "assets/clear.png";
      }
    case '04d':
      {
        return "assets/showers.png";
      }
    case '11d':
      {
        return "assets/lightrain.png";
      }
    case '03d':
      {
        return "assets/heavycloud.png";
      }
    default:
      {
        return "assets/snow.png";
      }
  }
}

String getDayName({required int value}) {
  switch (value) {
    case 0:
      {
        return "Sat";
      }
    case 1:
      {
        return "Sun";
      }
    case 2:
      {
        return "Mon";
      }
    case 3:
      {
        return "Tue";
      }
    case 4:
      {
        return "Wed";
      }
    case 5:
      {
        return "Thu";
      }
    default:
      {
        return "Fri";
      }
  }
}
