// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:srmhoteladmin/config/app_colors.dart';
import 'package:srmhoteladmin/helper/constants/app_string.dart';
import 'package:srmhoteladmin/module/auth/login/model/otp_body.dart';
import 'package:srmhoteladmin/module/auth/login/model/otp_form.dart';

import '../../../config/router.dart';
import '../../../core_components/custom_widget/round_button.dart';
import '../../../helper/util/form_error.dart';
import '../../../helper/util/validate.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> errors = [];
  TextEditingController phonecontroller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIdReceived = "";
  late String phnumber;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildPhoneFormField(),
                SizedBox(
                  height: 5,
                ),
                FormError(errors: errors),
                SizedBox(
                  height: 5,
                ),
                RoundButton(
                    text: AppString.generate_otp,
                    onPress: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                      }

                      verifyNumber();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: phonecontroller,
      onSaved: ((newValue) => phnumber = newValue!),
      onChanged: (value) async {
        if (value.isNotEmpty && errors.contains(phoneNullError)) {
          setState(() {
            errors.remove(phoneNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(phoneNullError)) {
          setState(() {
            errors.add(phoneNullError);
          });
        }
      },
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: AppString.phonenumber_label_text,
        labelStyle: TextStyle(color: AppColors.labeltextcolor),
        hintText: AppString.phonnumber_hint_text,
      ),
    );
  }

  //mobile otp generation
  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: '+91' + phonecontroller.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) => {
                print('logged in successfully'),
              });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIdReceived = verificationID;

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpVerification(
                        mobile_no: phonecontroller.text,
                        otpvalidationid: verificationID,
                      )));
          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }
}
