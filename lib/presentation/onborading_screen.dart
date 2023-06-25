import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_drop/presentation/home_screen.dart';

import '../widgets/onboard_widget.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController controller = PageController();

  bool onLast = false;
  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("HomeView", isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  onLast = (index == 2);
                });
              },
              children: const [
                OnboardWidget(
                  image: "assets/images/wallpaper.png",
                  title: "Minimalist Elegance",
                  description:
                      " Experience the allure of simplicity with Minimalist Elegance. Discover a refined collection of clean and understated wallpapers that embody the essence of minimalism",
                ),
                OnboardWidget(
                  image: "assets/images/painting.png",
                  title: "Artistic Expressions",
                  description:
                      "Unleash your creativity with Artistic Expressions. Immerse yourself in a gallery of captivating artworks and illustrations that will ignite your imagination.",
                ),
                OnboardWidget(
                  image: "assets/images/home_screen.png",
                  title: "Infinite Horizons",
                  description:
                      " Unlock a world of endless possibilities and elevate your device's aesthetics like never before",
                )
              ],
            ),
          ),
          onLast
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      showModalBottomSheet(
                        elevation: 0,
                        isDismissible: false,
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Lottie.asset("assets/images/image.json"),
                                const Padding(
                                  padding: EdgeInsets.only(right: 20, left: 20),
                                  child: Text(
                                    "Embark on a journey of boundless beauty with Infinite Horizons. Immerse yourself in a mesmerizing collection of breathtaking wallpapers that will transport your screen to new dimensions",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Prompt'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                FloatingActionButton(
                                  onPressed: () async {
                                    await _storeOnBoardInfo();
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const HomeScreen();
                                        },
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.wallpaper_rounded),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      controller.nextPage(
                          duration: const Duration(microseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
        ],
      ),
    ));
  }
}
