import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatri_cabs/src/feature/home/controller/home_controller.dart';
import 'package:yatri_cabs/src/utils/colors.dart';

class PickCityScreen extends ConsumerStatefulWidget {
  const PickCityScreen({super.key, required this.onCitySelect});
  final void Function(String) onCitySelect;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PickCityScreenState();
}

class _PickCityScreenState extends ConsumerState<PickCityScreen> {
  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filteredCities = ref.watch(cityFilterProvider);

    // if (ref.read(outStationTripCityProvider) != null) {
    //   final String cityName = ref.watch(outStationTripCityProvider `as ProviderListenable<String>);
    //   _cityController.text = cityName;
    // }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 29, 29),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: CustomColors.primaryGreen,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 29, 29),
        title: const Text(
          'Search Pick-up City',
          style: TextStyle(color: CustomColors.primaryGreen),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                ref.watch(cityFilterProvider.notifier).filterCities(value);
              },
              style: const TextStyle(
                color: Colors.white,
              ),
              keyboardType: TextInputType.text,
              cursorColor: CustomColors.primaryGreen,
              minLines: 1,
              controller: _cityController,
              onSubmitted: (value) async {},
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: CustomColors.primaryGreen,
                    width: 1.4,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: CustomColors.primaryGreen,
                    width: 1,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCities.length,
                itemBuilder: (context, index) {
                  final city = filteredCities[index];
                  return ListTile(
                    title: Text(city, style: const TextStyle(color: Colors.white)),
                    onTap: () {
                      widget.onCitySelect(city);

                      // _cityController.text = filteredCities[index];
                      // ref.read(outStationPickUpCityProvider.notifier).update((state) => _cityController.text.trim());
                      // ref.read(cityFilterProvider.notifier).clearFilterCities();
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
