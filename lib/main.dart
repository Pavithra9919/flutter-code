import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:srmhoteladmin/config/app_theme.dart';
import 'package:srmhoteladmin/config/router.dart';
import 'package:srmhoteladmin/helper/constants/app_string.dart';

import 'package:srmhoteladmin/module/auth/register/register_body.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.Route_Register,
      routes: Routes.getRoutes(),

    );
  }
}
