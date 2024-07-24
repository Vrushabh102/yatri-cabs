import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatri_cabs/src/core/providers.dart';
import 'package:yatri_cabs/src/feature/search_cities.dart/controller/controller.dart';
import 'package:yatri_cabs/src/models/city_model.dart';
import 'package:yatri_cabs/src/utils/colors.dart';

class SelectCity extends ConsumerStatefulWidget {
  const SelectCity({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectCityState();
}

class _SelectCityState extends ConsumerState<SelectCity> {
  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading = ref.watch(isLoadingProvider);
    bool isSearched = ref.watch(isSearchProvider);
    List<CityModel>? cities = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Cities'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      ref.read(isSearchProvider.notifier).update((state) => false);
                    }
                  },
                  keyboardType: TextInputType.text,
                  cursorColor: CustomColors.primaryGreen,
                  minLines: 1,
                  controller: _cityController,
                  onSubmitted: (value) async {
                    ref.read(isLoadingProvider.notifier).update((state) => true);
                    final cityController = ref.read(cityControllerProvider);
                    cities = await cityController.searchCities(value);

                    if (cities == null) {
                      ref.read(searchCityResultProvider.notifier).update((state) => 'Api has reched its limit');
                    } else if (cities!.isNotEmpty) {
                      ref.read(isSearchProvider.notifier).update((state) => true);
                    }
                    ref.read(isLoadingProvider.notifier).update((state) => false);
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.4,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              (isSearched)
                  ? ListView.builder(
                      itemCount: cities!.length,
                      itemBuilder: (context, index) {
                        return Text(cities![index].name);
                      },
                    )
                  : Center(
                      child: Text(ref.read(searchCityResultProvider)),
                    )
            ],
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: CustomColors.primaryGreen,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
