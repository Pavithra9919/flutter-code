// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srmhoteladmin/config/app_colors.dart';
import 'package:srmhoteladmin/config/app_text_styles.dart';
import 'package:srmhoteladmin/config/router.dart';
import 'package:srmhoteladmin/core_components/custom_widget/round_button.dart';
import 'package:srmhoteladmin/helper/constants/app_images.dart';
import 'package:srmhoteladmin/helper/constants/app_string.dart';
import 'package:srmhoteladmin/module/auth/login/model/otp_form.dart';

class OtpVerification extends StatefulWidget {
  final mobile_no, otpvalidationid;
  const OtpVerification(
      {Key? key, required this.mobile_no, required this.otpvalidationid})
      : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.otp_title),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    AppString.otp_title,
                    style: AppTextStyles.register_title_style,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    AppString.otp_description,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 35),
                  SvgPicture.asset(
                    AppImages.otp,
                    height: 150,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 10),
                  OtpForm(
                    OtpvalidationId: widget.otpvalidationid,
                    mobile_number: widget.mobile_no,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(AppString.resend),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      AppString.otp_resend,
                      style: TextStyle(color: AppColors.secondaryTextColor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
