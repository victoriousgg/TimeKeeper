import 'package:flutter/material.dart';
import 'package:timekeeper_app/screen/stop_watch_screen.dart';

enum Screen({
  required this.navigationDestination,
  required this.navigationRailDestination,
  required this.widget,
}) {
  home(
    navigationDestination: NavigationDestination(
      label: 'Home',
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      tooltip: 'Home',
    ),
    navigationRailDestination: NavigationRailDestination(
      label: Text('Home'),
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
    ),
    widget: Placeholder(),
  ),
  profile(
    navigationDestination: NavigationDestination(
      label: 'Profile',
      icon: Icon(Icons.person_outline),
      selectedIcon: Icon(Icons.person),
      tooltip: 'Profile',
    ),
    navigationRailDestination: NavigationRailDestination(
      label: Text('Profile'),
      icon: Icon(Icons.person_outline),
      selectedIcon: Icon(Icons.person),
    ),
    widget: Placeholder(),
  ),
  timer(
    navigationDestination: NavigationDestination(
      label: 'Timer',
      icon: Icon(Icons.timer_outlined),
      selectedIcon: Icon(Icons.timer),
      tooltip: 'Timer',
    ),
    navigationRailDestination: NavigationRailDestination(
      label: Text('Timer'),
      icon: Icon(Icons.timer_outlined),
      selectedIcon: Icon(Icons.timer),
    ),
    widget: StopWatchScreen(existingTime: mockExistingDuration),
  ),
  settings(
    navigationDestination: NavigationDestination(
      label: 'Settings',
      icon: Icon(Icons.settings_outlined),
      selectedIcon: Icon(Icons.settings),
      tooltip: 'Settings',
    ),
    navigationRailDestination: NavigationRailDestination(
      label: Text('Settings'),
      icon: Icon(Icons.settings_outlined),
      selectedIcon: Icon(Icons.settings),
    ),
    widget: Placeholder(),
  );

  final NavigationDestination navigationDestination;
  final NavigationRailDestination navigationRailDestination;
  final Widget widget;

  static final List<NavigationDestination> barDestinations = Screen.values
      .map((screen) => screen.navigationDestination)
      .toList();

  static final List<NavigationRailDestination> railDestinations = Screen.values
      .map((screen) => screen.navigationRailDestination)
      .toList();

  static final List<Widget> screenWidgets = Screen.values
      .map((screen) => screen.widget)
      .toList();

  // Example existing time
}

const mockExistingDuration = Duration(days: 1, minutes: 30, seconds: 45);
