import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Image_screen extends StatefulWidget {
  const Image_screen({super.key});

  @override
  State<Image_screen> createState() => _Image_screenState();
}

class _Image_screenState extends State<Image_screen> {

  File? image;
  final imagePicker =ImagePicker();

  upLoadImage()async{
    var  pickedImage= await imagePicker.pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: InkWell(
                  onTap: upLoadImage,
                  child: Text('Image')))
        ],
      ),
    );
  }
}
