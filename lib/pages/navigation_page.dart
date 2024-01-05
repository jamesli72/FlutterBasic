import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden_iot/helper/navigator_helper.dart';
import 'package:garden_iot/styles/app_colors.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  String _currentPage = 'Page1';

  final List<String> _pageKeys = [
    "Page1",
    "Page2",
    "Page3",
    "Page4",
  ];

  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
    "Page4": GlobalKey<NavigatorState>(),
  };

  void _selectTapped(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = _pageKeys[index];
        _currentIndex = index;
      });
    }
  }

  Widget _buildOffstageNavigator(String currentPage) {
    return Offstage(
      offstage: _currentPage != currentPage,
      child: TabNavigator(
          navigatorKey: _navigatorKeys[currentPage]!, tabItem: currentPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Page1") {
            _selectTapped("Page1", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator("Page1"),
            _buildOffstageNavigator("Page2"),
            _buildOffstageNavigator("Page3"),
            _buildOffstageNavigator("Page4")
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            _selectTapped(_pageKeys[index], index);
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/sensors.svg',
                colorFilter: ColorFilter.mode(
                    _currentIndex == 0
                        ? AppColors.iconColor
                        : AppColors.disableFont,
                    BlendMode.srcIn),
              ),
              label: 'Cảm biến',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/actuator.svg',
                colorFilter: ColorFilter.mode(
                    _currentIndex == 1
                        ? AppColors.iconColor
                        : AppColors.disableFont,
                    BlendMode.srcIn),
              ),
              label: 'Cơ cấu',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/report.svg',
                colorFilter: ColorFilter.mode(
                    _currentIndex == 2
                        ? AppColors.iconColor
                        : AppColors.disableFont,
                    BlendMode.srcIn),
              ),
              label: 'Báo cáo',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/account.svg',
                colorFilter: ColorFilter.mode(
                    _currentIndex == 3
                        ? AppColors.iconColor
                        : AppColors.disableFont,
                    BlendMode.srcIn),
              ),
              label: 'Tài khoản',
            )
          ],
          selectedItemColor: AppColors.iconColor, // color for selected item
          unselectedItemColor: AppColors.disableFont,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
