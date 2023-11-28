import 'package:flutter/material.dart';
import 'package:greate_places_app/provider/great_places.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_screen.dart';

class PLacesList extends StatelessWidget {
  const PLacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(AddPlaceScreen.addPlaceScreenRout);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future:
            Provider.of<GreatPlaces>(context, listen: false).fetchAndSetData(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    child: const Center(
                      child: Text('No Places added yet- Try adding some'),
                    ),
                    builder: (ctx, value, ch) => ListView.builder(
                      itemCount: value.item.length,
                      itemBuilder: (ctz, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(value.item[index].image),
                        ),
                        title: Text(value.item[index].title),
                        onTap: () {},
                      ),
                    ),
                  ),
      ),
    );
  }
}
