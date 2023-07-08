import 'dart:ui';

import 'package:anim_shop/screens/onboding/components/animated_btn.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OnbardingScreen extends StatefulWidget {
  const OnbardingScreen({super.key});

  @override
  State<OnbardingScreen> createState() => _OnbardingScreenState();
}

class _OnbardingScreenState extends State<OnbardingScreen> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Text(
                          "Learn desaign & code",
                          style: TextStyle(
                              fontSize: 60, fontFamily: "Poppins", height: 1.2),
                        ),
                        SizedBox(height: 16),
                        Text(
                            "on’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.")
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  AnimatedBtn(
                    btnAnimationController: _btnAnimationController,
                    press: () {
                      _btnAnimationController.isActive = true;
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                        "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
