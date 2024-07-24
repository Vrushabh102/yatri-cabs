import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatri_cabs/src/common/style/primary_button_style.dart';
import 'package:yatri_cabs/src/common/widgets/expore_cabs_containers.dart';
import 'package:yatri_cabs/src/common/widgets/home_containers.dart';
import 'package:yatri_cabs/src/core/providers.dart';
import 'package:yatri_cabs/src/feature/search_cities.dart/screen/select_city.dart';
import 'package:yatri_cabs/src/res/assets.dart';
import 'package:yatri_cabs/src/utils/colors.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    log(height.toString());
    log(width.toString());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(),
      bottomNavigationBar: bottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // info line
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: const TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                      children: [
                        TextSpan(text: 'India’s Leading'),
                        TextSpan(text: ' Inter-City One Way', style: TextStyle(color: CustomColors.primaryGreen)),
                        TextSpan(text: ' Cab Service Provider'),
                      ]),
                ),
              ),

              // add banner
              Image.asset(ImageAssets.addBanner),

              const SizedBox(
                height: 10,
              ),

              const Row(
                children: [
                  HomeTripContainer(
                    imagePath: IconAssets.outsideTripIcon,
                    title: 'Outstation Trip',
                    color: CustomColors.primaryGreen,
                    iconColor: Colors.white,
                    textColor: Colors.white,
                  ),
                  HomeTripContainer(
                    imagePath: IconAssets.localTripIcon,
                    title: 'Local Trip',
                    color: Colors.white,
                    iconColor: Colors.black,
                    textColor: Colors.black,
                  ),
                  HomeTripContainer(
                    imagePath: IconAssets.airportTripIcon,
                    title: 'Local Trip',
                    color: Colors.white,
                    iconColor: Colors.black,
                    textColor: Colors.black,
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              // two buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 0.032 * height,
                    width: 147,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: primaryButtonStyle(),
                      child: const Text(
                        'One-way',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                    width: 147,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Round Trip',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              // explore cabs container
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const ExploreCabsContainer(
                      leadingIconPath: IconAssets.locationIcon,
                      title: 'Pick-up City',
                      subtitle: 'Type City Name',
                      showClose: true,
                    ),
                    const ExploreCabsContainer(
                      leadingIconPath: IconAssets.flagIcon,
                      title: 'Drop City',
                      subtitle: 'Type City Name',
                      showClose: true,
                    ),
                    const ExploreCabsContainer(
                      leadingIconPath: IconAssets.dateIcon,
                      title: 'Pick-up City',
                      subtitle: 'Type City Name',
                      showClose: false,
                    ),
                    const ExploreCabsContainer(
                      leadingIconPath: IconAssets.timeIcon,
                      title: 'Pick-up Date',
                      subtitle: 'DD-MM-YYYY',
                      showClose: false,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          // goto search city...
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectCity(),));
                        },
                        style: primaryButtonStyle(),
                        child: const Text(
                          'Explore Cabs',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // illustration
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Image.asset(ImageAssets.homeIllustration),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // appbar for homescreen
  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(ImageAssets.appbarLogo),
            const ImageIcon(
              AssetImage(IconAssets.notifiactionIcon),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: ref.watch(currentScreenIndexProvider),
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        ref.read(currentScreenIndexProvider.notifier).update((state) => value);
      },
      backgroundColor: CustomColors.primaryGreen,
      elevation: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(IconAssets.home)), label: 'Home'),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(IconAssets.myTrip)), label: 'My Trip'),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(IconAssets.account)), label: 'Account'),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(IconAssets.more)), label: 'More'),
      ],
    );
  }
}
