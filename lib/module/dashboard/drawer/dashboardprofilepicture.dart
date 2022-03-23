// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:srmhoteladmin/config/app_colors.dart';
import 'package:srmhoteladmin/helper/constants/app_images.dart';
import 'package:srmhoteladmin/helper/constants/app_string.dart';

class DashboardProfilePicturePage extends StatefulWidget {
  const DashboardProfilePicturePage({Key? key}) : super(key: key);

  @override
  State<DashboardProfilePicturePage> createState() =>
      _DashboardProfilePicturePageState();
}

class _DashboardProfilePicturePageState
    extends State<DashboardProfilePicturePage> {
  File? _imagepath;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 115,
        width: 115,
        child: Stack(fit: StackFit.expand, children: [
          CircleAvatar(
            radius: 30,
            child: _imagepath == null
                ? Container(
                    child: Image.asset(
                      AppImages.defaultprofile,
                    ),
                  )
                : null,
            backgroundImage: _imagepath != null ? FileImage(_imagepath!) : null,
          ),
          Positioned(
            left: 65,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: AppColors.colorwhite)),
                onPressed: () {
                  _showPicker(context);
                },
                color: Color(0xFFC0C0C0),
                // (AppColors.labeltextcolor),
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
          )
        ]));
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Container(
            child: Wrap(
              children: [
                ListTile(
                  leading: IconButton(
                      onPressed: () {}, icon: Icon(Icons.photo_library)),
                  title: Text(AppString.galary),
                  onTap: () {
                    _pickImage();
                  },
                ),
                ListTile(
                  leading: IconButton(
                      onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
                  title: Text(AppString.camera),
                  onTap: () {
                    _captureImage();
                  },
                ),
              ],
            ),
          ));
        });
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

  void _captureImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        //getting img from galary and setting it to file variable
        _imagepath = File(image.path);
      });
    }
  }
}
