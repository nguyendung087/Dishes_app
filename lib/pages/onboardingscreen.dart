import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: h * 79,
                width: w,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/image.png"))),
              ),
            ),
            Center()
          ],
        ),
      ),
    );
  }
}
