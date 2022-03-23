import 'package:flutter/material.dart';
import 'package:srmhoteladmin/config/app_colors.dart';
import 'package:srmhoteladmin/helper/constants/app_string.dart';
import 'package:srmhoteladmin/module/dashboard/drawer/addcategory/category_body.dart';
import 'package:srmhoteladmin/repositories/firebase/databasemanager.dart';

alertbox(BuildContext context, String msg, String catname) {
  Widget cancelbtn = ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: AppColors.cancelcolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text(AppString.Alert_cancelbtn,
          style: TextStyle(color: AppColors.menuicon)));
  Widget yesbtn = ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: AppColors.yescolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      onPressed: () async {
        await DatabaseManager().createcategorylist(catname);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CategoryList()));
      },
      child: const Text(
        AppString.Alert_yesbtn,
        style: TextStyle(color: AppColors.menuicon),
      ));
  Widget alert = AlertDialog(
    content: Text(msg),
    actions: [yesbtn, cancelbtn],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
