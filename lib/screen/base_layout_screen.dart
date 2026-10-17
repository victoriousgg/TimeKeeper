import 'package:flutter/material.dart';
import 'package:timekeeper_app/screen/screen.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) =>
      setState(() => screenIndex = selectedScreen);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer =
        MediaQuery.orientationOf(context) != Orientation.portrait;
  }

  @override
  Widget build(BuildContext context) {
    return showNavigationDrawer
        ? buildDrawerScaffold(context)
        : buildBottomBarScaffold();
  }

  Widget buildBottomBarScaffold() {
    return Scaffold(
      body: Center(child: Screen.screenWidgets[screenIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: screenIndex,
        onDestinationSelected: (int index) =>
            setState(() => screenIndex = index),
        destinations: Screen.barDestinations,
      ),
    );
  }

  Widget buildDrawerScaffold(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
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
      ),
    );
  }
}
