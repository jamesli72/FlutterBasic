import 'package:flutter/material.dart';
import 'package:garden_iot/pages/account_page.dart';
import 'package:garden_iot/pages/actuator_page.dart';
import 'package:garden_iot/pages/alert_config.dart';
import 'package:garden_iot/pages/alert_page.dart';
import 'package:garden_iot/pages/create_note_page.dart';
import 'package:garden_iot/pages/mode_config_page.dart';
import 'package:garden_iot/pages/mode_page.dart';
import 'package:garden_iot/pages/note_page.dart';
import 'package:garden_iot/pages/photo_page.dart';
import 'package:garden_iot/pages/report_page.dart';
import 'package:garden_iot/pages/sensor_page.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  const TabNavigator(
      {super.key, required this.navigatorKey, required this.tabItem});

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (tabItem == "Page1") {
      child = const SensorPage();
    } else if (tabItem == "Page2") {
      child = ActuatorPage();
    } else if (tabItem == "Page3") {
      child = const ReportPage();
    } else {
      child = const AccountPage();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case '/picture_page':
            return MaterialPageRoute(builder: (context) => const PhotoPage());
          case '/mode_page':
            return MaterialPageRoute(builder: (context) => ModePage());
          case '/mode_page_config':
            return MaterialPageRoute(builder: (context) => const ModeConfig());
          case '/threshold_page':
            return MaterialPageRoute(builder: (context) => AlertPage());
          case '/threshold_page_config':
            return MaterialPageRoute(builder: (context) => const AlertConfig());
          case '/note_page':
            return MaterialPageRoute(builder: (context) => const NotePage());
          case '/create_note_page':
            return MaterialPageRoute(
                builder: (context) => const CreateNotePage());
          default:
            return MaterialPageRoute(builder: (context) => child);
        }
      },
    );
  }
}
