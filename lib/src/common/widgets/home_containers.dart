import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yatri_cabs/src/res/assets.dart';
import 'package:yatri_cabs/src/utils/colors.dart';

class HomeTripContainer extends StatelessWidget {
  const HomeTripContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.isSelected,
    required this.isOutsideStationTrip,
  });
  final String imagePath;
  final String title;
  final bool isSelected;
  final bool isOutsideStationTrip;
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
        color: (isSelected) ? CustomColors.primaryGreen : Colors.white,
      ),
      height: 0.091 * height,
      width: width * 0.295,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (isOutsideStationTrip && !isSelected)
              ? Image.asset(IconAssets.unselectedIcon)
              : Image.asset(
                  imagePath,
                  height: 40,
                  width: 40,
                  color: (isOutsideStationTrip)
                      ? null
                      : (isSelected)
                          ? Colors.white
                          : Colors.black,
                ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: (isSelected) ? Colors.white : Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
