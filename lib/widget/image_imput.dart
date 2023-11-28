import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImagePreview extends StatefulWidget {
  final Function onSelected;

  const ImagePreview({super.key, required this.onSelected});

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  File? _storedImage;

  Future<void> _takePicker() async {
    final imagefile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imagefile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imagefile.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imagefile.path);
    final savedImage =
        await File(imagefile.path).copy('${appDir.path}/$fileName');
    widget.onSelected(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text("No Image Selected"),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: _takePicker,
            label: const Text("Browse"),
            icon: const Icon(Icons.camera),
          ),
        )
      ],
    );
  }
}
