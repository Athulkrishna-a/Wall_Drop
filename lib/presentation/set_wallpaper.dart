import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class SetWall extends StatefulWidget {
  final String imageUrl;
  const SetWall({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<SetWall> createState() => _SetWallState();
}

class _SetWallState extends State<SetWall> {
  Future<void> setWallpaperFromFile() async {
    // ignore: unused_local_variable
    String result;
    var file =
        await DefaultCacheManager().getSingleFile(widget.imageUrl.toString());

    try {
      result = (await WallpaperManager.setWallpaperFromFile(
              file.path, WallpaperManager.HOME_SCREEN))
          .toString();
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }
  }

  Future<void> setWallpaperFromlock() async {
    // ignore: unused_local_variable
    String results;
    var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);

    try {
      results = (await WallpaperManager.setWallpaperFromFile(
              file.path, WallpaperManager.LOCK_SCREEN))
          .toString();
    } on PlatformException {
      results = 'Failed to get wallpaper.';
    }
  }

  Future<void> setWallpaperFromBoth() async {
    // ignore: unused_local_variable
    String resultent;
    var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);

    try {
      resultent = (await WallpaperManager.setWallpaperFromFile(
              file.path, WallpaperManager.BOTH_SCREEN))
          .toString();
    } on PlatformException {
      resultent = 'Failed to get wallpaper.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      )),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0, top: 10),
              child: FloatingActionButton.extended(
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
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              child: Text(
                                "Feel free to choose the one that resonates with you the most and set it as your wallpaper!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Prompt'),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            FloatingActionButton.extended(
                              onPressed: () {
                                setWallpaperFromFile();
                              },
                              icon: const Icon(Icons.wallpaper_rounded),
                              label: const Text(
                                "Home Screen",
                                style: TextStyle(fontFamily: 'Prompt'),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            FloatingActionButton.extended(
                              onPressed: () {
                                setWallpaperFromlock();
                              },
                              icon: const Icon(Icons.wallpaper_rounded),
                              label: const Text(
                                "Lock Screen",
                                style: TextStyle(fontFamily: 'Prompt'),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            FloatingActionButton.extended(
                              onPressed: () {
                                setWallpaperFromBoth();
                              },
                              icon: const Icon(Icons.photo),
                              label: const Text(
                                "Both Screen ",
                                style: TextStyle(fontFamily: 'Prompt'),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                label: const Text(
                  "APPLY",
                  style: TextStyle(fontFamily: 'Prompt'),
                ),
                icon: const Icon(Icons.wallpaper_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
