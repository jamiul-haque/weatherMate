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
