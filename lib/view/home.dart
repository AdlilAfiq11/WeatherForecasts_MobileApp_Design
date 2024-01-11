import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:one_clock/one_clock.dart';
import 'package:timezone/standalone.dart' as tz;

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late tz.Location locationName;
  late tz.TZDateTime locTime;
  int _currentIndex = 0;
  bool isDay = true;

  // final tabs = const [
  //   Center(child: Text('Favorite Page')),
  //   Center(child: Text('Search Page')),
  // ];

  @override
  void initState() {
    super.initState();
    chooseDateTime(isDay);
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
      body: Container(
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
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Image.asset(
                  "assets/images/weatherIcon.png",
                  scale: 3.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  '28°C',
                  style: TextStyle(
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
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: DigitalClock(
                  showSeconds: false,
                  isLive: false,
                  digitalClockTextColor: Colors.black,
                  decoration: const BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  datetime: locTime,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: AnalogClock(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.0,
                        color: Colors.black,
                      ),
                      color: Colors.black,
                      shape: BoxShape.circle),
                  width: 200.0,
                  height: 200.0,
                  isLive: true,
                  hourHandColor: Colors.red,
                  minuteHandColor: Colors.white,
                  showSecondHand: false,
                  numberColor: Colors.white,
                  showNumbers: true,
                  textScaleFactor: 1.4,
                  showTicks: true,
                  showDigitalClock: true,
                  datetime: locTime,
                ),
              ),
            ],
          ),
        ),
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
                  text: 'Weather',
                  onPressed: () => showDetails()),
              const GButton(
                icon: Icons.home,
                text: 'Home',
                // onPressed: () => favorite(context),
              ),
              const GButton(
                icon: Icons.notes,
                text: 'Details',
                // onPressed: () => search(context),
              ),
            ],
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  showDetails() => showModalBottomSheet(
      backgroundColor: Colors.blue.shade900,
      showDragHandle: true,
      elevation: 3.0,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade900,
                Colors.purple.shade600,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          height: 350,
          child: const Column(
            children: <Widget>[
              ListTile(
                leading: Text('Today',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )),
                trailing: Text('February, 10',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )),
              ),
              Divider(
                thickness: 2.0,
                indent: 20.0,
                endIndent: 20.0,
                height: 0.1,
                color: Colors.white24,
              ),
              ListTile(
                title: Text('Weather Forecasts',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )),
              ),
              Row(
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
              SizedBox(
                height: 20,
              ),
              ListTile(
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
