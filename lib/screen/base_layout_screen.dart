import 'package:flutter/material.dart';
import 'package:timekeeper_app/screen/screen.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  int screenIndex = 0;
  late bool showNavigationDrawer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer =
        MediaQuery.orientationOf(context) != Orientation.portrait;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showNavigationDrawer
          ? SafeArea(
              bottom: false,
              top: false,
              child: Row(
                children: [
                  Padding(
                    padding: const .symmetric(horizontal: 5),
                    child: NavigationRail(
                      minWidth: 50,
                      destinations: Screen.railDestinations,
                      selectedIndex: screenIndex,
                      useIndicator: true,
                      onDestinationSelected: (int index) =>
                          setState(() => screenIndex = index),
                    ),
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(child: Screen.screenWidgets[screenIndex]),
                ],
              ),
            )
          : Center(child: Screen.screenWidgets[screenIndex]),
      bottomNavigationBar: showNavigationDrawer
          ? null
          : NavigationBar(
              selectedIndex: screenIndex,
              onDestinationSelected: (int index) =>
                  setState(() => screenIndex = index),
              destinations: Screen.barDestinations,
            ),
    );
  }
}
