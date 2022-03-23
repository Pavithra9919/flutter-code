// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:srmhoteladmin/config/app_text_styles.dart';
import 'package:srmhoteladmin/config/router.dart';
import 'package:srmhoteladmin/core_components/custom_widget/round_button.dart';
import 'package:srmhoteladmin/helper/constants/app_images.dart';
import 'package:srmhoteladmin/helper/constants/app_string.dart';
import 'package:srmhoteladmin/module/auth/register/register_form.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.register),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  AppString.register,
                  style: AppTextStyles.register_title_style,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  AppString.register_description,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 45),
                SvgPicture.asset(
                  AppImages.register,
                  height: 200,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 20),
                RegisterForm(),

              ]),
            ),
          ),
        ),
      ),
    );
  }
}
