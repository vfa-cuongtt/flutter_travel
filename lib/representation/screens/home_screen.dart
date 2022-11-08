import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/dimension_contants.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/screens/hotel_screen.dart';
import 'package:travel_app/representation/widgets/item_category_widget.dart';

import '../../core/helpers/asset_helper.dart';
import '../widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidgets(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hi Ryan!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  Text(
                    'Where are you going next?',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              const Spacer(),
              const Icon(
                FontAwesomeIcons.bell,
                size: kDefaultIconSize,
                color: Colors.white,
              ),
              const SizedBox(
                width: kTopPadding,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kItemPadding),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(kMinPadding),
                child: ImageHelper.loadFromAsset(AssetHelper.avatar),
              ),
            ],
          ),
        ),
        child: Column(
          children: [
            // Search text field
            TextField(
              decoration: InputDecoration(
                hintText: 'Search your destination',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(kTopPadding),
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.black,
                    size: kDefaultPadding,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(kItemPadding),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding),
              ),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              children: [
                Expanded(
                  child: ItemCategoryWidget(
                    title: 'Hotel',
                    icon: ImageHelper.loadFromAsset(
                      AssetHelper.iconHotel,
                      width: kBottomBarIconSize,
                      height: kBottomBarIconSize,
                    ),
                    color: const Color(0xFFFE9C5E),
                    onTap: () {
                      Navigator.of(context).pushNamed(HotelScreen.routeName);
                    },
                  ),
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Expanded(
                  child: ItemCategoryWidget(
                    title: 'Flights',
                    icon: ImageHelper.loadFromAsset(
                      AssetHelper.iconPlane,
                      width: kBottomBarIconSize,
                      height: kBottomBarIconSize,
                    ),
                    color: const Color(0xFFF77777),
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Expanded(
                  child: ItemCategoryWidget(
                    title: 'All',
                    icon: ImageHelper.loadFromAsset(
                      AssetHelper.iconHotelPlane,
                      width: kBottomBarIconSize,
                      height: kBottomBarIconSize,
                    ),
                    color: const Color(0xFF3EC8BC),
                    onTap: () {
                      print('ALL _____');
                    },
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
