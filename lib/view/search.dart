import 'package:flutter/material.dart';
import 'package:weather_app/view/utils/main_utils.dart';

class WeatherLocationView extends StatefulWidget {
  const WeatherLocationView({super.key});

  @override
  State<WeatherLocationView> createState() => _WeatherLocationViewState();
}

class _WeatherLocationViewState extends State<WeatherLocationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: backgroundColor('main'),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
          child: SearchAnchor(
            isFullScreen: false,
            viewHintText: "Search Location",
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(10, (int index) {
                final String items = 'items $index';
                return ListTile(
                  title: Text(items),
                  onTap: () {
                    setState(() {
                      controller.closeView(items);
                    });
                  },
                );
              });
            },
          ),
        ),
      ]),
    );
  }
}
