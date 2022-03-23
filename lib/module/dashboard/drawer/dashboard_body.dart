// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:srmhoteladmin/helper/constants/app_images.dart';
import 'package:srmhoteladmin/helper/constants/app_string.dart';

import 'dashboard_menu.dart';

List gridimages = [
  {
    "image": AppImages.dashboardtodaysalee,
    "name": AppString.dashboardtodaysale,
    "color": Colors.blue
  },
  {
    "image": AppImages.dashboardpendingsale,
    "name": AppString.dashboardpendingsale,
    "color": Colors.blue
  },
  {
    "image": AppImages.dashboardcategorycount,
    "name": AppString.dashboardcategorycount,
    "color": Colors.blue
  },
  {
    "image": AppImages.dashboardproductcount,
    "name": AppString.dashboardproductcount,
    "color": Colors.blue
  },
  {
    "image": AppImages.dashboardcancelledorders,
    "name": AppString.dashboardcancelledorders,
    "color": Colors.blue
  },
];

class AdminDashboard extends StatelessWidget {
  AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      drawer: DashboardMenuScreen(),
      body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Positioned(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1100,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          children: gridimages
                              .map((mygridimage) => Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Card(
                                      elevation: 20,
                                      color: Colors.blue.shade200,
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(right: 10, left: 15),
                                        width: 150,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 200,
                                                  height: 130,
                                                  child: Image.asset(
                                                    "${mygridimage['image']}",
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text("${mygridimage['name']}",
                                                    style: TextStyle(
                                                      color: Colors.blue.shade900,
                                                    )),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ))),
              ),
            ],
          )),
    );
  }
}
