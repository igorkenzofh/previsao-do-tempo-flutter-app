import '../services/location.dart';
import 'package:clima/networking.dart';

//TODO 9 : Pegando a api
const apiKey = '77958c53e03c4213ac2b094756f01e3c';
const openWeatherMapUrl =
    'https://api.openweathermap.org/data/2.5/weather?lat=';

class WeatherModel {
  // TODO 20: Refactor
  Future getLocationWeather() async {
    double latitude;
    double longitude;

    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper netWorkerHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await netWorkerHelper.getData();

    return weatherData;
  }

  Future getCityWeather(String cityNamed) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityNamed&appid=$apiKey&units=metric';
    NetworkHelper netWorkHelper = NetworkHelper(url);

    var weatherData = await netWorkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
