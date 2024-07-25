import 'package:flutter/material.dart';
import 'package:yatri_cabs/src/utils/colors.dart';

ButtonStyle primaryButtonStyle(bool isSelected) {
  return ButtonStyle(
    backgroundColor: isSelected
        ? const MaterialStatePropertyAll(
            CustomColors.primaryGreen,
          )
        : const MaterialStatePropertyAll(Colors.white),
  );
}
