import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../config/router.dart';
import '../../../../core_components/custom_widget/round_button.dart';
import '../../../../helper/constants/app_string.dart';

class OtpForm extends StatefulWidget {
  final String mobile_number, OtpvalidationId;
  const OtpForm(
      {Key? key, required this.mobile_number, required this.OtpvalidationId})
      : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  TextEditingController otpcontroller = TextEditingController();
  String verificationIdReceived = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: SingleChildScrollView(
        child: Column(children: [
          Text('OTP has been Sent to this Mobile Number : ' +
              widget.mobile_number),
          PinFieldAutoFill(
            controller: otpcontroller,
            codeLength: 6,
            onCodeChanged: (val) {
              print(val);
            },
          ),
          SizedBox(
            height: 10,
          ),
          RoundButton(
              text: AppString.submit,
              onPress: () {
                verifyCode();
                // Navigator.pushNamed(context, Routes.Route_dashboard);
              }),
        ]),
      ),
    );
  }

  void verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.OtpvalidationId, smsCode: otpcontroller.text);
    await auth.signInWithCredential(credential).then((value) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.Route_dashboard, (route) => false);
    });
  }
}
