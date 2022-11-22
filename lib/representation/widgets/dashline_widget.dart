import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_contants.dart';

class DashLineWidget extends StatelessWidget {
  const DashLineWidget(
      {Key? key, this.height = 1, this.color = ColorPalette.dividerColor})
      : super(key: key);

  final double height;
  final Color color;

  // * Render dash lines
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final boxWidth = constraints.constrainWidth();
      const dashWidth = 6.0;
      final dashHeight = height;
      final dashCount = (boxWidth / (2 * dashWidth)).floor();
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(
              dashCount,
              (_) {
                return SizedBox(
                  width: dashWidth,
                  height: dashHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: color),
                  ),
                );
              },
            )),
      );
    });
  }
}
