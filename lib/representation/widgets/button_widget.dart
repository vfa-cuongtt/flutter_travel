import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_contants.dart';
import 'package:travel_app/core/constants/textstyle_constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.title, this.onTap, this.opacity})
      : super(key: key);

  // Button title
  final String title;
  // Button function event
  final Function()? onTap;
  final Color? opacity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient:
              opacity != null ? null : Gradients.defaultGradientBackground,
          color: opacity,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyles.defaultStyle.bold.copyWith(
              color:
                  opacity != null ? ColorPalette.primaryColor : Colors.white),
        ),
      ),
    );
  }
}
