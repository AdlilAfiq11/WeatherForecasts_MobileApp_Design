import 'package:flutter/material.dart';

BoxDecoration backgroundColor(String backgroundType) {
  switch (backgroundType) {
    case "bottomNavigationBar":
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade700,
            Colors.blue.shade800,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
    case "showModalBottomSheet":
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade500,
            Colors.blue.shade600,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
    case "daysForecasts":
      return BoxDecoration(
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
      );
    case "airQuality":
      return BoxDecoration(
        border: Border.all(
          width: 0.2,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Colors.purple.shade600,
            Colors.purple.shade900,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      );
    case "weatherDetails":
      return BoxDecoration(
        border: Border.all(
          width: 0.2,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade600,
            Colors.blue.shade300,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      );
    case "main":
    default:
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade200,
            Colors.blue.shade400,
            Colors.blue.shade700,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
  }
}

class SlideRoute extends PageRouteBuilder {
  final Widget page;
  SlideRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
