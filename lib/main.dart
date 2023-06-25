import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_drop/presentation/home_screen.dart';

import 'package:wall_drop/presentation/onborading_Screen.dart';
import 'package:wall_drop/widgets/page_transition.dart';

int? isViwed;
void main() async {
  runApp(
    const MyApp(),
  );
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViwed = prefs.getInt("HomeView");
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "WallDrop",
          theme: ThemeData(
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CustomTransitionBuilder(),
                },
              ),
              colorScheme: lightDynamic,
              useMaterial3: true,
              fontFamily: 'Prompt'),
          darkTheme: ThemeData(
            colorScheme: darkDynamic,
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          home: isViwed != 0 ? const OnboardScreen() : const HomeScreen(),
        );
      },
    );
  }
}
