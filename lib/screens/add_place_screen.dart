import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/great_places.dart';
import '../widget/image_imput.dart';
import '../widget/location_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const addPlaceScreenRout = 'addPlaceScreenRoue';
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  File? _selectedImage;
  void selectedImage(File selectedImage) {
    _selectedImage = selectedImage;
  }

  void save() {
    if (_titleController.text.isEmpty || _selectedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .savePlace(_titleController.text, _selectedImage!);
    Navigator.of(context).pop();
  }

  final _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Places"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Title',
                        ),
                        controller: _titleController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ImagePreview(onSelected: selectedImage),
                      const SizedBox(
                        height: 10,
                      ),
                      const LocationInput()
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: save,
              icon: const Icon(Icons.add),
              label: const Text("Add Place"),
            )
          ]),
    );
  }
}
