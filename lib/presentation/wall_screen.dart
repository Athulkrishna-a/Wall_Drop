// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wall_drop/model/pixelapi.dart';
import 'package:wall_drop/presentation/set_wallpaper.dart';

import '../doamin/api_key.dart';

class WallScreen extends StatefulWidget {
  const WallScreen({super.key});

  @override
  State<WallScreen> createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  PixelImage pixelapi = PixelImage();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fectData();
  }

  void scrollListener() {
    scrollController.addListener(() {
      int showoffset = pixelapi.hits!.length;

      if (scrollController.offset > showoffset) {
        setState(() {});
      } else {
        setState(() {
          //update state
        });
      }
    });
  }

  bool isLoading = true;
  int page = 1;
  Future<void> fectData() async {
    try {
      const url =
          "https://pixabay.com/api/?key=" + apikey + "&per_page=190&page=1";
      final response = await http.get(Uri.parse(url));
      final json = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(
          () {
            pixelapi = PixelImage.fromJson(json);
            isLoading = false;
          },
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  PixelImage pixelNo = PixelImage();
  loadMore() async {
    setState(() {
      if (page <= 3) {
        page++;
      } else {
        page = 1;
      }
    });
    // ignore: unused_local_variable
    String uri = "https://pixabay.com/api/?key=" +
        apikey +
        "&per_page=190&page=" +
        page.toString();
    final response = await http.get(Uri.parse(uri));
    final json = jsonDecode(response.body);

    
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(
        () {
          pixelapi = PixelImage.fromJson(json);
          isLoading = false;
          // ignore: avoid_print
          print(json);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                controller: scrollController,
                itemCount: pixelapi.hits!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return SetWall(
                            imageUrl: pixelapi.hits![index].largeImageUrl!,
                          );
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(25, 255, 82, 82),
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: NetworkImage(
                                pixelapi.hits![index].previewUrl!,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          " LOAD MORE ",
          style: TextStyle(fontFamily: 'Prompt'),
        ),
        onPressed: () {
          loadMore();
          scrollController.animateTo(0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn);
        },
        icon: const Icon(Icons.arrow_drop_down_circle),
      ),
    );
  }
}
