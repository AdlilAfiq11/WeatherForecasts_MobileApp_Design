import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';
import 'package:timezone/standalone.dart' as tz;

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  bool isDay = false;
  DateTime utcTime = DateTime.utc(1989, 11, 9);
  late tz.Location locationName;
  late tz.TZDateTime locTime;

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
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: isDay
                  ? const AssetImage("assets/images/day.jpg")
                  : const AssetImage("assets/images/night.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Center(
            child: Column(
              children: <Widget>[
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
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          elevation: 10,
          backgroundColor: Colors.grey.shade500,
          label: const Row(
            children: [Icon(Icons.change_circle), Text(' Change')],
          ),
          onPressed: () {
            isDay = !isDay;
            chooseDateTime(isDay);
            setState(() {});
          }),
    );
  }
}
