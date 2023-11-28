import 'dart:io';

class PlaceLocation {
  final double latTitude;
  final double longiTtitude;
  final String adress;

  PlaceLocation({
    required this.latTitude,
    required this.longiTtitude,
    required this.adress,
  });
}

class Places {
  final String id;
  final String title;
  final File image;
  // final PlaceLocation location;

  Places({
    required this.id,
    required this.title,
    required this.image,
    // required this.location,
  });
}
