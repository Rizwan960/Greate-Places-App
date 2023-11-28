import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/great_places.dart';
import './screens/place_list_screen.dart';
import './screens/add_place_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            // ignore: deprecated_member_use
            accentColor: Colors.amber),
        home: const PLacesList(),
        routes: {
          AddPlaceScreen.addPlaceScreenRout: (context) =>
              const AddPlaceScreen(),
        },
      ),
    );
  }
}
