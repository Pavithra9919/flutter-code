import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srmhoteladmin/helper/constants/app_images.dart';
import '../constants/app_sizeconfig.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => FormErrorText(error: errors[index])),
    );
  }

  Row FormErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.error,
            height: getproportionateScreenHeight(14),
            width: getproportionateScreenWidth(14)),
        SizedBox(
          width: getproportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}
