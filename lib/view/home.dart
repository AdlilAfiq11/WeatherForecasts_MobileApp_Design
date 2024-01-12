import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:timezone/standalone.dart' as tz;
import 'package:weather_app/view/details/details.dart';
import 'package:weather_app/view/search.dart';
import 'package:weather_app/view/weather.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with TickerProviderStateMixin {
  late tz.Location locationName;
  late tz.TZDateTime locTime;
  late final TabController _tabController;
  int _currentIndex = 1;
  bool isDay = true;

  @override
  void initState() {
    super.initState();
    chooseDateTime(isDay);
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  Future<DateTime> chooseDateTime(bool isDay) async {
    if (isDay) {
      locationName = tz.getLocation('Asia/Kuala_Lumpur');
    } else {
      locationName = tz.getLocation('Asia/Tokyo');
    }
    locTime = tz.TZDateTime.now(locationName);
    return locTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          WeatherLocationView(),
          WeatherPageView(),
          WeatherDetailsView(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.shade900,
              Colors.purple.shade800,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
          child: GNav(
            curve: Curves.easeInCubic,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.purple.shade700,
            gap: 5,
            selectedIndex: _currentIndex,
            padding: const EdgeInsets.all(20),
            tabs: [
              GButton(
                icon: Icons.location_on_outlined,
                text: 'Search',
                onPressed: () {
                  _tabController.animateTo(1);
                },
              ),
              GButton(
                icon: Icons.home,
                text: 'Home',
                onPressed: () {
                  _tabController.animateTo(1);
                },
              ),
              GButton(
                icon: Icons.notes,
                text: 'Details',
                onPressed: () {
                  _tabController.animateTo(2);
                },
              ),
            ],
            onTabChange: (index) {
              setState(() {
                _tabController.animateTo(index);
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
