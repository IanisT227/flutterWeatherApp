import 'location.dart';
import 'networking.dart';

const apiKey = "c10ea175e6e987ca70d4627b2cfddbbc";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=c10ea175e6e987ca70d4627b2cfddbbc&units=metric';
    print(cityName);
    NetworkHelper helper = NetworkHelper(url);
    var weatherData = await helper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentPosition();

    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=c10ea175e6e987ca70d4627b2cfddbbc&units=metric';
    NetworkHelper helper = NetworkHelper(url);
    var weatherData = await helper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp == 404)
      return 'An error occurred';
    else if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else if (temp <= 20 && temp >= 10) {
      return 'Bring a 🧥 just in case';
    }
  }
}
