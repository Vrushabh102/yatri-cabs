import 'package:flutter/material.dart';
import 'package:yatri_cabs/src/res/assets.dart';
import 'package:yatri_cabs/src/utils/colors.dart';

class ExploreCabsContainer extends StatelessWidget {
  const ExploreCabsContainer({super.key, required this.title, required this.subtitle, required this.leadingIconPath, required this.showClose});
  final String title;
  final String subtitle;
  final String leadingIconPath;
  final bool showClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CustomColors.exploreCabsContainer,
      ),
      child: ListTile(
          title: Text(
            title,
            style: const TextStyle(color: CustomColors.primaryGreen, fontSize: 12),
          ),
          leading: Image.asset(
            leadingIconPath,
            height: 31,
            width: 31,
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 12),
          ),
          trailing: (showClose)
              ? Image.asset(IconAssets.closeIcon)
              : const SizedBox(
                  height: 0,
                  width: 0,
                )),
    );
  }
}
