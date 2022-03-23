import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_sizeconfig.dart';


class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    required this.SvgIcon,
  }) : super(key: key);

  final String SvgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, getproportionateScreenWidth(20),
          getproportionateScreenWidth(20), getproportionateScreenWidth(20)),
      child: SvgPicture.asset(SvgIcon,
          height: getproportionateScreenHeight(18), color: Colors.black),
    );
  }
}
