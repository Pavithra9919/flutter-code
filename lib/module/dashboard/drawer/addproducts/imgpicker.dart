import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:srmhoteladmin/config/app_colors.dart';

class ImgPicker extends StatefulWidget {
  const ImgPicker({Key? key}) : super(key: key);

  @override
  _ImgPickerState createState() => _ImgPickerState();
}

class _ImgPickerState extends State<ImgPicker> {
  File? _imagepath;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(20), // Image border
    child: SizedBox.fromSize(
    size: Size.fromRadius(48),
        child:_imagepath == null
            ? Center(
                child: Text('Upload Product Image Here'),
              )
            : Container(
                color: AppColors.colorwhite,
                height: 100,
                width: 150,
                child: Image.file(_imagepath!, fit: BoxFit.cover),
              ),
    ),),
        Container(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 1),
                child: IconButton(
                    onPressed: () {
                      // _showPicker(context);
                      _pickImage();
                    },
                    // icon:  Icon( AppImages.galleryy),
                    icon: Icon(
                      Icons.photo_album_rounded,
                      size: 35,
                      color: AppColors.primary,
                    )),
              ),
            ],
          ),
          padding: EdgeInsets.all(10),
        ),
      ],
    );
  }

  void _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        //getting img from galary and setting it to file variable
        _imagepath = File(image.path);
      });
    }
  }
}
