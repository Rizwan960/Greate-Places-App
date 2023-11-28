import 'dart:io';
import '../helper/db_helper.dart';
import 'package:flutter/material.dart';
import '../model/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Places> _items = [];

  List<Places> get item {
    return [..._items];
  }

  void savePlace(String title, File pickedImage) {
    final newPlace = Places(
      id: DateTime.now().toString(),
      title: title,
      image: pickedImage,
      // location: null ,
    );
    _items.add(newPlace);
    notifyListeners();
    DbHelper.insert('User_Places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetData() async {
    final dbList = await DbHelper.fetchData('User_Places');
    _items = dbList
        .map(
          (e) => Places(
            id: e['id'],
            title: e['title'],
            image: File(
              e['image'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
