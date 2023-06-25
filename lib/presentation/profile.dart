import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.settings),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                const Text(
                  "Settings",
                  style: TextStyle(
                      fontFamily: 'Prompt',
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.info_outline_rounded),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                const Text(
                  "About ",
                  style: TextStyle(
                      fontFamily: 'Prompt',
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'ATHUL KRISHNA A',
                  style: TextStyle(
                    fontFamily: 'Prompt',
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.telegram),
                ),
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.snapchat_outlined),
                ),
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.facebook),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.privacy_tip_rounded),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                const Text(
                  "Legal ",
                  style: TextStyle(
                      fontFamily: 'Prompt',
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Privacy Policy",
              style: TextStyle(fontFamily: 'Prompt', fontSize: 22.0),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.verified_user),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                const Text(
                  "Version ",
                  style: TextStyle(
                      fontFamily: 'Prompt',
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "WallDrop",
              style: TextStyle(fontFamily: 'Prompt', fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "version : 1.0.0",
              style: TextStyle(fontFamily: 'Prompt', fontSize: 16.0),
            ),
          ],
        ),
      )),
    );
  }
}
