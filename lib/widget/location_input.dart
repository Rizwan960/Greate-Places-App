import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../helper/loction_helper.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _imagePreviewUrl;
  Future<void> getUserCurrentLoction() async {
    final locData = await Location().getLocation();
    final staticMapUrl = LocationHelper.generatedLocationPrivewImage(
      latitude: locData.latitude,
      longitude: locData.longitude,
    );
    setState(() {
      _imagePreviewUrl = staticMapUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _imagePreviewUrl == null
              ? const Text(
                  "No Location Chosen",
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _imagePreviewUrl.toString(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: getUserCurrentLoction,
              label: const Text("Current Location"),
              icon: const Icon(Icons.location_on),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text("Select on Map"),
              icon: const Icon(Icons.map),
            ),
          ],
        )
      ],
    );
  }
}
