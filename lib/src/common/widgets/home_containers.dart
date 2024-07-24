import 'dart:developer';

import 'package:flutter/material.dart';

class HomeTripContainer extends StatelessWidget {
  const HomeTripContainer({super.key, required this.imagePath, required this.title, required this.color, required this.iconColor, required this.textColor});
  final String imagePath;
  final String title;
  final Color color;
  final Color iconColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    log('height in container$height');
    log('height in container$width');
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: color,
      ),
      height: 0.091 * height,
      width: width * 0.295,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 40,
            width: 40,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
