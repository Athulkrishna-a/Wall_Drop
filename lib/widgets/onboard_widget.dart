import 'package:flutter/material.dart';

class OnboardWidget extends StatelessWidget {
  const OnboardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(image),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 39.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Prompt'),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25.0, left: 25.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Prompt'),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
