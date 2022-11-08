import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_contants.dart';

class ItemCategoryWidget extends StatelessWidget {
  const ItemCategoryWidget({
    Key? key,
    required this.icon,
    required this.color,
    this.onTap,
    required this.title,
  }) : super(key: key);
  final Widget icon;
  final Color color;
  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: kMediumPadding),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kItemPadding),
            ),
            child: icon,
          ),
          const SizedBox(height: kItemPadding),
          Text(title),
        ],
      ),
    );
  }
}
