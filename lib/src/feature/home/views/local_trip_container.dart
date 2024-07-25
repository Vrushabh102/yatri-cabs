import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatri_cabs/src/common/style/primary_button_style.dart';
import 'package:yatri_cabs/src/common/widgets/expore_cabs_containers.dart';
import 'package:yatri_cabs/src/feature/search_cities.dart/screen/select_city.dart';
import 'package:yatri_cabs/src/res/assets.dart';

class LocalTripContainer extends ConsumerWidget {
  const LocalTripContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ExploreCabsContainer(
            onClear: () {},
            leadingIconPath: IconAssets.locationIcon,
            title: 'Pickup City',
            subtitle: 'Type City Name',
            showClose: true,
          ),
          ExploreCabsContainer(
            onClear: () {},
            leadingIconPath: IconAssets.dateIcon,
            title: 'Pickup Date',
            subtitle: 'DD-MM-YYYY',
            showClose: false,
          ),
          ExploreCabsContainer(
            onClear: () {},
            leadingIconPath: IconAssets.dateIcon,
            title: 'Time',
            subtitle: 'HH:MM',
            showClose: false,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 50,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                // goto search city...
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectCity(),
                  ),
                );
              },
              style: primaryButtonStyle(true),
              child: const Text(
                'Explore Cabs',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}
