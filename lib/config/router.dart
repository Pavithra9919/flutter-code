import 'package:flutter/material.dart';
import 'package:srmhoteladmin/module/auth/login/model/otp_body.dart';
import 'package:srmhoteladmin/module/auth/register/register_body.dart';
import 'package:srmhoteladmin/module/dashboard/drawer/addcategory/category_body.dart';
import 'package:srmhoteladmin/module/dashboard/drawer/addproducts/productsbody.dart';
import 'package:srmhoteladmin/module/dashboard/drawer/dashboard_body.dart';

class Routes {
  static const String Route_dashboard = "/dashboard";
  static const String Route_Register = "/register";
  static const String Route_AddProducts = "/addproducts";
  static const String Route_AddCategory = "/addcategory";
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.Route_dashboard: (context) => AdminDashboard(),
      Routes.Route_Register: (context) => RegisterBody(),
      Routes.Route_AddProducts: (context) => ProductsBody(),
      Routes.Route_AddCategory: (context) => CategoryList(),
    };
  }
}
