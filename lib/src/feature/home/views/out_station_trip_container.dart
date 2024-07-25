import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:yatri_cabs/src/common/style/primary_button_style.dart';
import 'package:yatri_cabs/src/common/widgets/expore_cabs_containers.dart';
import 'package:yatri_cabs/src/core/providers.dart';
import 'package:yatri_cabs/src/feature/home/views/pick_city_screen.dart';
import 'package:yatri_cabs/src/feature/search_cities.dart/screen/select_city.dart';
import 'package:yatri_cabs/src/res/assets.dart';

// ONE WAY

// Provider for Pick-up City
final pickUpCityOutStationProvider = StateProvider<String>((ref) => '');

// Provider for Drop City
final dropCityOutStationProvider = StateProvider<String>((ref) => '');

// providers for pick up date
final pickUpDateOneWayOutStationProvider = StateProvider<String>((ref) {
  return '';
});

final timeOutStationTripProvider = StateProvider<String>((ref) => '');
// TWO WAY / ROUND TRIP

final pickUpCityOutStationRoundTripProvider = StateProvider<String>((ref) => '');

final destinationOutStationTripProvider = StateProvider<String>((ref) => '');

final timeRoundOutStationTripContainer = StateProvider<String>((ref) => '');

// from date
final fromDateOutStationProvider = StateProvider((ref) => '');
final toDateOutStationProvider = StateProvider((ref) => '');

class OutStationTrip extends ConsumerWidget {
  const OutStationTrip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripCategory = ref.watch(roundTripProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: tripCategory == 0
          ? Column(
              children: [
                InkWell(
                  onTap: () {
                    // pick city name....
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PickCityScreen(onCitySelect: (selectedCity) {
                          ref.read(pickUpCityOutStationProvider.notifier).state = selectedCity;
                        }),
                      ),
                    );
                  },
                  child: ExploreCabsContainer(
                    onClear: () {
                      ref.read(pickUpCityOutStationProvider.notifier).update((state) => '');
                    },
                    leadingIconPath: IconAssets.locationIcon,
                    title: 'Pick-up City',
                    subtitle: ref.watch(pickUpCityOutStationProvider).isNotEmpty ? ref.watch(pickUpCityOutStationProvider) : 'Type city name',
                    showClose: true,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // pick city name....
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PickCityScreen(onCitySelect: (selectedCity) {
                          ref.read(dropCityOutStationProvider.notifier).state = selectedCity;
                        }),
                      ),
                    );
                  },
                  child: ExploreCabsContainer(
                    onClear: () {
                      ref.read(dropCityOutStationProvider.notifier).update((state) => '');
                    },
                    leadingIconPath: IconAssets.flagIcon,
                    title: 'Drop City',
                    subtitle: ref.watch(dropCityOutStationProvider).isNotEmpty ? ref.watch(dropCityOutStationProvider) : 'Type city name',
                    showClose: true,
                  ),
                ),

                // date picker for one way trip...
                InkWell(
                  onTap: () {
                    _showDatePicker(
                      context,
                      ref,
                      (formattedDate) {
                        ref.read(pickUpDateOneWayOutStationProvider.notifier).update((state) => formattedDate);
                      },
                    );
                  },
                  child: ExploreCabsContainer(
                    onClear: () {},
                    leadingIconPath: IconAssets.dateIcon,
                    title: 'Pick-up Date',
                    subtitle: ref.watch(pickUpDateOneWayOutStationProvider).isEmpty ? 'DD-MM-YYYY' : ref.read(pickUpDateOneWayOutStationProvider),
                    showClose: false,
                  ),
                ),

                InkWell(
                  onTap: () {
                    _showTimePicker(
                      context,
                      ref,
                      (recivedTime) {
                        ref.watch(timeOutStationTripProvider.notifier).update((state) => recivedTime);
                      },
                    );
                  },
                  child: ExploreCabsContainer(
                    onClear: () {},
                    leadingIconPath: IconAssets.timeIcon,
                    title: 'Time',
                    subtitle: ref.watch(timeOutStationTripProvider).isNotEmpty ? ref.watch(timeOutStationTripProvider) : 'HH:MM',
                    showClose: false,
                  ),
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
                ),
              ],
            )
          : Column(
              // round trip container
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PickCityScreen(
                          onCitySelect: (selectedCity) {
                            ref.read(pickUpCityOutStationRoundTripProvider.notifier).update((state) => selectedCity);
                          },
                        ),
                      ),
                    );
                  },
                  child: ExploreCabsContainer(
                    onClear: () {},
                    leadingIconPath: IconAssets.locationIcon,
                    title: 'Pick-up City',
                    subtitle: ref.watch(pickUpCityOutStationRoundTripProvider).isNotEmpty ? ref.watch(pickUpCityOutStationRoundTripProvider) : 'Type City Name',
                    showClose: true,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PickCityScreen(
                          onCitySelect: (selectedCity) {
                            ref.read(destinationOutStationTripProvider.notifier).update((state) => selectedCity);
                          },
                        ),
                      ),
                    );
                  },
                  child: ExploreCabsContainer(
                    onClear: () {},
                    leadingIconPath: IconAssets.flagIcon,
                    title: 'Destination',
                    subtitle: ref.watch(destinationOutStationTripProvider).isNotEmpty ? ref.watch(destinationOutStationTripProvider) : 'Type City Name',
                    showClose: true,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showTimePicker(
                      context,
                      ref,
                      (recivedTime) {
                        ref.watch(timeRoundOutStationTripContainer.notifier).update((state) => recivedTime);
                      },
                    );
                  },
                  child: ExploreCabsContainer(
                    onClear: () {},
                    leadingIconPath: IconAssets.dateIcon,
                    title: 'Time',
                    subtitle: ref.watch(timeRoundOutStationTripContainer).isNotEmpty ? ref.watch(timeRoundOutStationTripContainer) : 'HH:MM',
                    showClose: false,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // from date column
                    InkWell(
                      onTap: () {
                        _showDatePicker(
                          context,
                          ref,
                          (pickedDate) {
                            ref.watch(fromDateOutStationProvider.notifier).update((state) => pickedDate);
                          },
                        );
                      },
                      child: Column(
                        children: [
                          const Text('From Date'),
                          Text(ref.watch(fromDateOutStationProvider).isEmpty ? 'DD-MM-YYYY' : ref.watch(fromDateOutStationProvider)),
                        ],
                      ),
                    ),
                    Image.asset(IconAssets.dateRoundTripIcon),
                    InkWell(
                      onTap: () {
                        _showDatePicker(
                          context,
                          ref,
                          (pickedDate) {
                            ref.watch(toDateOutStationProvider.notifier).update((state) => pickedDate);
                          },
                        );
                      },
                      child: Column(
                        children: [
                          const Text('To Date'),
                          Text(ref.watch(toDateOutStationProvider).isEmpty ? 'DD-MM-YYYY' : ref.watch(toDateOutStationProvider)),
                        ],
                      ),
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
                        ),
                      );
                    },
                    style: primaryButtonStyle(true),
                    child: const Text(
                      'Explore Cabs',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void _showDatePicker(BuildContext context, WidgetRef ref, Function(String) onDateSelect) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((selectedDate) {
      if (selectedDate != null) {
        String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
        onDateSelect(formattedDate);
      }
    });
  }

  void _showTimePicker(BuildContext context, WidgetRef ref, Function(String) selectedTime) {
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((timeOfDay) {
      if (timeOfDay != null) {
        final now = DateTime.now();
        final dateTime = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
        final formattedTime = DateFormat('hh:mm a').format(dateTime);
        selectedTime(formattedTime);
      }
    });
  }
}
