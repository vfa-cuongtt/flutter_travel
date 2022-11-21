import 'package:flutter/material.dart';

import '../../core/constants/dimension_contants.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';

class ItemUtilityHotelWidget extends StatelessWidget {
  ItemUtilityHotelWidget({Key? key}) : super(key: key);

  final List<Map<String, String>> listUtility = [
    {
      'icon': AssetHelper.iconFreeWifi,
      'name': 'Free\nWifi',
    },
    {
      'icon': AssetHelper.iconNonRefundable,
      'name': 'Non-\nRefundable',
    },
    {
      'icon': AssetHelper.iconFreeBreakfast,
      'name': 'Free\nBreakfast',
    },
    {
      'icon': AssetHelper.iconNonSmoking,
      'name': 'Non-\nSmoking',
    }
  ];

  Widget _buildItemUtilityHotel(String icon, String name) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(icon),
        const SizedBox(
          height: kTopPadding,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listUtility
            .map((e) => _buildItemUtilityHotel(e['icon']!, e['name']!))
            .toList(),
      ),
    );
  }
}
