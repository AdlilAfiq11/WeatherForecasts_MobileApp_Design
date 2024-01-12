import 'package:flutter/material.dart';

class WeatherLocationView extends StatefulWidget {
  const WeatherLocationView({super.key});

  @override
  State<WeatherLocationView> createState() => _WeatherLocationViewState();
}

class _WeatherLocationViewState extends State<WeatherLocationView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.blue.shade900,
            Colors.purple.shade600,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Text('Search Location'),
    );
  }
}
