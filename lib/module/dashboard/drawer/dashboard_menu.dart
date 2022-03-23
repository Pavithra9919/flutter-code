// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srmhoteladmin/config/app_colors.dart';
import 'package:srmhoteladmin/config/router.dart';
import 'package:srmhoteladmin/helper/constants/app_images.dart';
import 'package:srmhoteladmin/helper/constants/app_string.dart';

import 'dashboardprofilepicture.dart';

class DashboardMenuScreen extends StatefulWidget {
  const DashboardMenuScreen({Key? key}) : super(key: key);

  @override
  State<DashboardMenuScreen> createState() => _DashboardMenuScreenState();
}

class _DashboardMenuScreenState extends State<DashboardMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            Column(
              children: [
                DashboardProfilePicturePage(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'logged user',
                  // '${Loggeduser}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ],
            ),
            Divider(
              height: 20,
              color: AppColors.labeltextcolor,
            ),
            ListTile(
                leading: SvgPicture.asset(
                  AppIcons.categorymenuicon,
                  height: 30,
                  width: 30,
                ),
                title: Text(AppString.addCategorymenu),
                onTap: () {
                  Navigator.pushNamed(context, Routes.Route_AddCategory);
                }),
            ListTile(
                leading: SvgPicture.asset(
                  AppIcons.productmenuicon,
                  height: 30,
                  width: 30,
                ),
                //  leading: Image.asset(AppIcons.products),
                title: Text(
                  AppString.addProductmenu,
                ),
                onTap: () {
                  Navigator.pushNamed(context, Routes.Route_AddProducts);
                }),
            ListTile(
                leading: SvgPicture.asset(
                  AppIcons.viewusermenuicon,
                  height: 30,
                  width: 30,
                ),
                title: Text(
                  AppString.viewappusermenu,
                ),
                onTap: () {
                  // Navigator.pushNamed(context, Routes.Route_AddProducts);
                }),
            ListTile(
                leading: SvgPicture.asset(
                  AppIcons.addsubadmin,
                  height: 30,
                  width: 30,
                ),
                title: Text(
                  AppString.addsubadminmenu,
                ),
                onTap: () {
                  // Navigator.pushNamed(context, Routes.Route_AddProducts);
                }),
            ListTile(
                leading: SvgPicture.asset(
                  AppIcons.logout,
                  height: 30,
                  width: 30,
                ),
                title: Text(
                  AppString.logout,
                ),
                onTap: () {
                  // Navigator.pushNamed(context, Routes.Route_AddProducts);
                }),
          ],
        ),
      ),
    );
  }
}
