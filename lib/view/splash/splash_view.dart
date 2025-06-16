// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:creaftmyplate/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
       Get.toNamed(AppRoutes.home);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF6318AF),
            child: Stack(
              children: [
                Positioned(
                  top: -100,
                  right: -100,
                  child: CustomPaint(
                    size: const Size(200, 200),
                    painter: CurvePainter(
                        color: const Color(0xFFF7E5B7), topRight: true),
                  ),
                ),
                Positioned(
                  bottom: -100,
                  left: -50,
                  child: CustomPaint(
                    size: const Size(200, 200),
                    painter: CurvePainter(
                        color: const Color(0xFFF7E5B7), bottomLeft: true),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icon/Logo.svg',
                        height: Get.height * 0.2,
                      ), 
                      const SizedBox(height: 20),
                      const Text(
                        'Welcome',
                        style: TextStyle(
                            color: Color(0xFFF7E5B7),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Capriola"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final Color color;
  final bool topRight;
  final bool bottomLeft;

  CurvePainter(
      {required this.color, this.topRight = false, this.bottomLeft = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    if (topRight) {
      path.moveTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.quadraticBezierTo(size.width / 2, size.height, 0, size.height);
    } else if (bottomLeft) {
      path.moveTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.quadraticBezierTo(0, size.height / 2, size.width, 0);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}