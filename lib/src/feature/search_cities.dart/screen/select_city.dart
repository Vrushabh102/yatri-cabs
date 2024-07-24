import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yatri_cabs/src/feature/search_cities.dart/controller/controller.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Cities'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              // changes the value of seachBarText to see
              if (value.isEmpty) {}
            },
            keyboardType: TextInputType.text,
            cursorColor: CustomColors.primaryGreen,
            minLines: 1,
            controller: _cityController,
            onSubmitted: (value) {
              final cityController = ref.read(cityControllerProvider);
              cityController.searchCities(value);
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
        ],
      ),
    );
  }
}
