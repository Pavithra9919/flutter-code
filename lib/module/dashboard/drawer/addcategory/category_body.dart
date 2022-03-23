import 'dart:io';

import 'package:flutter/material.dart';
import 'package:srmhoteladmin/config/app_colors.dart';
import 'package:srmhoteladmin/core_components/custom_widget/round_button.dart';
import 'package:srmhoteladmin/helper/constants/app_images.dart';
import 'package:srmhoteladmin/helper/constants/app_string.dart';

import 'package:image_picker/image_picker.dart';
import 'package:srmhoteladmin/repositories/firebase/databasemanager.dart';

import 'categoy_list.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final form_key = GlobalKey<FormState>();

  TextEditingController category_name = TextEditingController();
  File? _imagepath;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.categorylist),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: ListView(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(AppImages.dashboard_starter),
                    ),
                    title: Text(AppString.starters),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage(AppImages.dashboard_maincourse),
                    ),
                    title: Text(AppString.maincourse),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(AppImages.dashboard_dessert),
                    ),
                    title: Text(AppString.dessert),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage(AppImages.dashboard_beverages),
                    ),
                    title: Text(AppString.beverages),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(AppString.add),
                  content: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: category_name,
                              decoration: InputDecoration(
                                labelText: AppString.category_name,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: IconButton(
                                      onPressed: () {
                                        _pickImage();
                                      },
                                      icon: Icon(
                                        Icons.photo_album_rounded,
                                        size: 35,
                                        color: AppColors.primary,
                                      )),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            20), // Image border
                                        child: SizedBox.fromSize(
                                          size: Size.fromRadius(48),
                                          child: _imagepath == null
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10, top: 26),
                                                  child:
                                                      Text('Upload Image Here'),
                                                )
                                              : Container(
                                                  color: AppColors.colorwhite,
                                                  height: 100,
                                                  width: 150,
                                                  child: Image.file(_imagepath!,
                                                      fit: BoxFit.cover),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            RoundButton(
                                text: AppString.add,
                                onPress: () {
                                  var catname = category_name.text.trim();

                                  if (catname.isNotEmpty) {
                                    String msg = AppString.Alert_msg;
                                    alertbox(context, msg, catname);
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
        backgroundColor: AppColors.primary,
        child: Icon(Icons.add),
      ),
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
