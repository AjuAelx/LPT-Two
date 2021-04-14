import 'package:flutter/material.dart';
import 'package:flutter_application_1/Configurations/config.dart';
import 'package:flutter_application_1/screens/FirstHomePage.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavState();
  }
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return 
    ChangeNotifierProvider<NavigationBottomProvider>(
      create: (context) => NavigationBottomProvider(),
       child: Consumer<NavigationBottomProvider>(
        builder: (context, data, child) {
          return Scaffold(
            body: data.currentScreen,
            bottomNavigationBar: new BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(
                      Icons.home_outlined,
                      size: 20.0,
                    )),
                BottomNavigationBarItem(
                    label: 'Bookmark',
                    icon: Icon(
                      Icons.bookmark_border_outlined,
                      size: 20.0,
                    )),
                BottomNavigationBarItem(
                    label: 'Settings',
                    icon: Icon(
                      Icons.settings_outlined,
                      size: 20.0,
                    )),
                BottomNavigationBarItem(
                    label: 'Notification',
                    icon: Icon(
                      Icons.notifications_outlined,
                      size: 20.0,
                    )),
              ],
              unselectedLabelStyle: Configuration.poppins,
              unselectedItemColor: Configuration.bottomNavTextUnselectedColor,
              unselectedFontSize: 11.0,
              selectedItemColor: Configuration.bottomNavTextSelectedColor,
              selectedFontSize: 11.0,
              selectedLabelStyle: Configuration.poppins,
              currentIndex: data.currentTab,
              onTap: (int index) {
                data.currentTab = index;
              },
            ),
          );
        },
       ),
    );
  }
}

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: Center(
        child: new Text('Coming Soon'),
      ),
    );
  }
}

class NavigationBottomProvider with ChangeNotifier {
  int _currentTab = 0;
  List<Widget> _screens = [
    HomePage1(),
    ComingSoon(),
    ComingSoon(),
    ComingSoon(),
  ];
  set currentTab(int tab) {
    this._currentTab = tab;
    notifyListeners();
  }

  get currentTab => this._currentTab;
  get currentScreen => this._screens[this._currentTab];
}
