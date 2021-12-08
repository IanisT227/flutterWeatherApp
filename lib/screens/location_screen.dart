import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:basic_utils/basic_utils.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;

  const LocationScreen({this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temp;
  int condition;
  String city;
  String conditionDesc;
  WeatherModel weatherModel = new WeatherModel();

  void updateUI(var weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 404;
        condition = 805;
        conditionDesc = "";
        city = "Error";
        return;
      }

      temp = weatherData['main']['temp'].round();
      condition = weatherData['weather'][0]['id'];
      city = weatherData['name'];
      conditionDesc = weatherData['weather'][0]['description'];
      conditionDesc = StringUtils.capitalize(conditionDesc, allWords: true);

      // int temperature= temp.ceil();
      print(temp);
      print(condition);
      print(weatherModel.getWeatherIcon(condition));
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/wallpaper.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () async {
                        var weatherData =
                            await weatherModel.getLocationWeather();
                        setState(() {
                          updateUI(weatherData);
                        });
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () async {
                        setState(() async {
                          var typedCityName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CityScreen()));
                          if (typedCityName != null) {
                            var weatherData = await weatherModel
                                .getCityWeather(typedCityName);
                            updateUI(weatherData);
                          }
                        });
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          conditionDesc,
                          style: kMainPageTextStyle.copyWith(fontSize: 50.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        weatherModel.getWeatherIcon(this.condition),
                        style: kConditionTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          '$temp°',
                          style: kMainPageTextStyle,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          '$city',
                          style: kMainPageTextStyle.copyWith(fontSize: 60.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 8.0, 2.0),
                        child: Text(
                          weatherModel.getMessage(temp),
                          style: kMainPageTextStyle.copyWith(fontSize: 50.0),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// Row(
// children: <Widget>[
// Text(
// '$temp°',
// style: kMainPageTextStyle,
// ),
// Text(
// weatherModel.getWeatherIcon(this.condition),
// style: kConditionTextStyle,
// ),
// ],
// ),
// ),
// Padding(
// padding: EdgeInsets.only(right: 15.0),
// child: Text(
// "$city",
// textAlign: TextAlign.right,
// style: kMessageTextStyle,
// ),
// ),
// Padding(
// padding: EdgeInsets.only(right: 15.0),
// child: Text(
// weatherModel.getMessage(temp),
// textAlign: TextAlign.right,
// style: kMessageTextStyle,
// ),
// ),
// ],
