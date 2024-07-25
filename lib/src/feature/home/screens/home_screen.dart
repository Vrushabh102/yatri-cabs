import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatri_cabs/src/common/style/primary_button_style.dart';
import 'package:yatri_cabs/src/common/widgets/home_containers.dart';
import 'package:yatri_cabs/src/core/providers.dart';
import 'package:yatri_cabs/src/feature/home/views/airport_transfer_trip_container.dart';
import 'package:yatri_cabs/src/feature/home/views/local_trip_container.dart';
import 'package:yatri_cabs/src/feature/home/views/out_station_trip_container.dart';
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
    List<Widget> listOfTipContainers = [
      const OutStationTrip(),
      const LocalTripContainer(),
      const AirportTripContainer(),
    ];

    final currTripCategory = ref.watch(tripCategoryIndexProvider);
    final roundTrip = ref.watch(roundTripProvider);
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

              Row(
                children: [
                  InkWell(
                    radius: 20,
                    onTap: () {
                      ref.read(tripCategoryIndexProvider.notifier).update((state) => 0);
                    },
                    child: HomeTripContainer(
                      isOutsideStationTrip: true,
                      imagePath: IconAssets.outsideTripIcon,
                      title: 'Outstation Trip',
                      isSelected: currTripCategory == 0,
                    ),
                  ),
                  InkWell(
                    radius: 20,
                    onTap: () {
                      ref.read(tripCategoryIndexProvider.notifier).update((state) => 1);
                    },
                    child: HomeTripContainer(
                      isOutsideStationTrip: false,
                      imagePath: IconAssets.localTripIcon,
                      title: 'Local Trip',
                      isSelected: currTripCategory == 1,
                    ),
                  ),
                  InkWell(
                    radius: 20,
                    onTap: () {
                      ref.read(tripCategoryIndexProvider.notifier).update((state) => 2);
                    },
                    child: HomeTripContainer(
                      isOutsideStationTrip: false,
                      imagePath: IconAssets.airportTripIcon,
                      title: 'Airport Transfer',
                      isSelected: currTripCategory == 2,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              // two buttons
              (currTripCategory == 0)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 0.032 * height,
                          width: 147,
                          child: ElevatedButton(
                            onPressed: () {
                              ref.read(roundTripProvider.notifier).update((state) => 0);
                            },
                            style: primaryButtonStyle(roundTrip == 0),
                            child: Text(
                              'One-way',
                              style: TextStyle(color: roundTrip == 0 ? Colors.white : Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 28,
                          width: 147,
                          child: ElevatedButton(
                            style: primaryButtonStyle(roundTrip == 1),
                            onPressed: () {
                              ref.read(roundTripProvider.notifier).update((state) => 1);
                            },
                            child: Text(
                              'Round Trip',
                              style: TextStyle(color: roundTrip == 1 ? Colors.white : Colors.black),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),

              const SizedBox(
                height: 10,
              ),

              // enter city,date details container
              listOfTipContainers[ref.watch(tripCategoryIndexProvider)],

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
