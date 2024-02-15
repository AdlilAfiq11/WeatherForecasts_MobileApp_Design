import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/view/utils/main_utils.dart';

class WeatherPageView extends StatefulWidget {
  const WeatherPageView({super.key, required this.weather});

  final Weather weather;
  @override
  State<WeatherPageView> createState() => _WeatherPageViewState();
}

class _WeatherPageViewState extends State<WeatherPageView> {
  final now = DateTime.now();
  String current = '';
  String min = '';
  String max = '';

  @override
  void initState() {
    super.initState();
    getTemperature();
  }

  void getTemperature() {
    String? stringTemp = widget.weather.temperature.toString();
    String? stringTempMin = widget.weather.tempMax.toString();
    String? stringTempMax = widget.weather.tempMin.toString();

    String temp = stringTemp.substring(0, stringTemp.indexOf(' '));
    String minTemp = stringTempMin.substring(0, stringTempMin.indexOf(' '));
    String maxTemp = stringTempMax.substring(0, stringTempMax.indexOf(' '));

    setState(() {
      current = temp;
      min = minTemp;
      max = maxTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd('en_US').format(now);

    return Container(
      decoration: backgroundColor('main'),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/weatherIcon.png",
              scale: 3.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                '$current°',
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                'Precipitations',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Min: $min°',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Max: $max°',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
              child: GestureDetector(
                onTap: () => showTodayWeather(formattedDate),
                child: Image.asset(
                  "assets/images/house.png",
                  scale: 2.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showTodayWeather(formattedDate) => showModalBottomSheet(
      backgroundColor: Colors.blue.shade500,
      showDragHandle: true,
      elevation: 3.0,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) {
        return Container(
          decoration: backgroundColor('showModalBottomSheet'),
          height: 350,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: const Text('Today',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )),
                trailing: Text('$formattedDate',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )),
              ),
              const Divider(
                thickness: 2.0,
                indent: 20.0,
                endIndent: 20.0,
                height: 0.1,
                color: Colors.white24,
              ),
              const ListTile(
                title: Text('Weather Forecasts',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                        child: Text(
                          '28°C',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Image(
                        image: AssetImage("assets/images/weatherIcon.png"),
                        width: 70,
                        height: 70,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '15.00',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                        child: Text(
                          '28°C',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Image(
                        image: AssetImage("assets/images/weatherIcon.png"),
                        width: 70,
                        height: 70,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '16.00',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                        child: Text(
                          '28°C',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Image(
                        image: AssetImage("assets/images/weatherIcon.png"),
                        width: 70,
                        height: 70,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '17.00',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                        child: Text(
                          '28°C',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Image(
                        image: AssetImage("assets/images/weatherIcon.png"),
                        width: 70,
                        height: 70,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '18.00',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const ListTile(
                title: Text(
                    '*Disclaimer: The weather forecasts is just a prediction, not totally accurate.',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        );
      });
}
