import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatri_cabs/src/common/style/primary_button_style.dart';
import 'package:yatri_cabs/src/common/widgets/expore_cabs_containers.dart';
import 'package:yatri_cabs/src/core/providers.dart';
import 'package:yatri_cabs/src/feature/search_cities.dart/screen/select_city.dart';
import 'package:yatri_cabs/src/res/assets.dart';

class AirportTripContainer extends ConsumerWidget {
  const AirportTripContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final oneWayOrRound = ref.watch(roundTripProvider);
    final airportDirection = ref.watch(airportDirectionProvider);

    // if oneWayOrRound == 1 -> one way
    // if oneWayOrRound == 1 -> round trip
    return oneWayOrRound == 0
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 0.032 * height,
                      width: 147,
                      child: ElevatedButton(
                        onPressed: () {
                          ref.read(airportDirectionProvider.notifier).update((state) => 0);
                        },
                        style: primaryButtonStyle(airportDirection == 0),
                        child: Text(
                          'To The Airport',
                          style: TextStyle(color: airportDirection == 0 ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.032 * height,
                      width: 170,
                      child: ElevatedButton(
                        style: primaryButtonStyle(airportDirection == 1),
                        onPressed: () {
                          ref.read(airportDirectionProvider.notifier).update((state) => 1);
                        },
                        child: Text(
                          'From The Airport',
                          maxLines: 1,
                          style: TextStyle(
                            color: airportDirection == 1 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ExploreCabsContainer(
                  onClear: () {},
                  leadingIconPath: IconAssets.locationIcon,
                  title: 'Pick-up City',
                  subtitle: 'Type City Name',
                  showClose: true,
                ),
                ExploreCabsContainer(
                  onClear: () {},
                  leadingIconPath: IconAssets.dateIcon,
                  title: 'Pick-up Date',
                  subtitle: 'DD-MM-YYYY',
                  showClose: false,
                ),
                ExploreCabsContainer(
                  onClear: () {},
                  leadingIconPath: IconAssets.timeIcon,
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
          )
        : Container(
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
                  title: 'Pick-up City',
                  subtitle: 'Type City Name',
                  showClose: true,
                ),
                ExploreCabsContainer(
                  onClear: () {},
                  leadingIconPath: IconAssets.flagIcon,
                  title: 'Destination',
                  subtitle: 'Type City Name',
                  showClose: true,
                ),
                ExploreCabsContainer(
                  onClear: () {},
                  leadingIconPath: IconAssets.dateIcon,
                  title: 'Time',
                  subtitle: 'HH:MM',
                  showClose: false,
                ),
                Row(
                  children: [
                    // from date column
                    const Column(
                      children: [
                        Text('From Date'),
                        Text('DD-MM-YYYY'),
                      ],
                    ),

                    Image.asset(IconAssets.dateRoundTripIcon),

                    const Column(
                      children: [
                        Text('To Date'),
                        Text('DD-MM-YYYY'),
                      ],
                    ),
                  ],
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
                          ));
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
