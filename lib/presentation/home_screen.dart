import 'package:flutter/material.dart';

import 'package:wall_drop/presentation/profile.dart';

import 'package:wall_drop/presentation/wall_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final screens = [
    const WallScreen(),
    const ProfileScreen(),
    // const CollectionScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        leading: const Icon(
          Icons.wallpaper,
        ),
        title: const Center(
          child: Text(
            "Wall Drop",
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Prompt'),
          ),
        ),
      ),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          height: 70,
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          onDestinationSelected: (index) {
            setState(() {
              this.index = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              selectedIcon: Icon(Icons.home),
            ),
            // NavigationDestination(
            //   icon: Icon(Icons.category_outlined),
            //   label: "Collection",
            //   selectedIcon: Icon(Icons.category),
            // ),
            NavigationDestination(
              icon: Icon(Icons.group_outlined),
              label: "Profile",
              selectedIcon: Icon(Icons.group),
            )
          ],
        ),
      ),
    );
  }
}
