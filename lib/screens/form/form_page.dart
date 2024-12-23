import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final List<XFile> _mediaFiles = [];

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickMedia() async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles != null && _mediaFiles.length + pickedFiles.length <= 5) {
      setState(() {
        _mediaFiles.addAll(pickedFiles);
      });
    } else if (_mediaFiles.length + (pickedFiles?.length ?? 0) > 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Maksimal 5 media yang dapat ditambahkan!"),
        ),
      );
    }
  }

  void _removeMedia(int index) {
    setState(() {
      _mediaFiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Catatan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            const Text(
              "Tambahkan Media",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ..._mediaFiles.asMap().entries.map(
                  (entry) {
                    final index = entry.key;
                    final file = entry.value;
                    return Stack(
                      children: [
                        Image.file(
                          File(file.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: GestureDetector(
                            onTap: () => _removeMedia(index),
                            child: const Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                if (_mediaFiles.length < 5)
                  GestureDetector(
                    onTap: _pickMedia,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ),
              ],
            ),
            if (_mediaFiles.length == 5)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "+3 media lainnya",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            const SizedBox(height: 16),
            const Text(
              "File berupa JPEG, PNG, dan .MP4",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    backgroundColor: const Color(0xFF24B351),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Kirimkan Hasil Temuan",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const FaIcon(
                        FontAwesomeIcons.paperPlane,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
