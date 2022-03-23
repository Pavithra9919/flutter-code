import 'package:flutter/material.dart';
import 'package:srmhoteladmin/config/app_colors.dart';
import 'package:srmhoteladmin/config/app_text_styles.dart';

class RoundButton extends StatelessWidget {
  final String text;

  final Function onPress;

  final Color color, textcolor;

  const RoundButton(
      {Key? key,
      required this.text,
      required this.onPress,
      this.color = Colors.red,
      this.textcolor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: ElevatedButton(
          onPressed: () {
            onPress();
          },
          style: ElevatedButton.styleFrom(primary: AppColors.primary),
          child: Text(
            text,
            style: AppTextStyles.defaultStyle,
          ),
        ),
      ),
    );
  }
}
