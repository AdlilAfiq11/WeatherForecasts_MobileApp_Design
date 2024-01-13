import 'package:flutter/material.dart';
import 'package:weather_app/view/utils/main_utils.dart';

class WeatherDetailsView extends StatefulWidget {
  const WeatherDetailsView({super.key});

  @override
  State<WeatherDetailsView> createState() => _WeatherDetailsViewState();
}

class _WeatherDetailsViewState extends State<WeatherDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundColor('main'),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                'Kuala Lumpur',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Max: 24°',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Max: 18°',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 40, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Days Forecasts',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.2,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple.shade400,
                                Colors.purple.shade900,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: const Column(
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
                                image:
                                    AssetImage("assets/images/weatherIcon.png"),
                                width: 50,
                                height: 50,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Text(
                                  'Mon',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 150,
                          decoration: backgroundColor('daysForecasts'),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                                child: Text(
                                  '26°C',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Image(
                                image:
                                    AssetImage("assets/images/weatherIcon.png"),
                                width: 50,
                                height: 50,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Text(
                                  'Tue',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.2,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple.shade400,
                                Colors.purple.shade900,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                                child: Text(
                                  '27°C',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Image(
                                image:
                                    AssetImage("assets/images/weatherIcon.png"),
                                width: 50,
                                height: 50,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Text(
                                  'Wed',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.2,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple.shade400,
                                Colors.purple.shade900,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: const Column(
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
                                image:
                                    AssetImage("assets/images/weatherIcon.png"),
                                width: 50,
                                height: 50,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Text(
                                  'Thu',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Container(
                width: 345,
                height: 125,
                decoration: backgroundColor('airQuality'),
                child: const Column(
                  children: [
                    Text('AIR QUALITY'),
                    Text('3-Low Health Risk'),
                    Text('See More'),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    width: 160,
                    height: 130,
                    decoration: backgroundColor('weatherDetails'),
                    child: const Center(child: Text('data')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    width: 160,
                    height: 130,
                    decoration: backgroundColor('weatherDetails'),
                    child: const Center(child: Text('data')),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
