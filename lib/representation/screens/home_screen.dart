import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/dimension_contants.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/widgets/item_category_widget.dart';
import '../../core/constants/textstyle_constants.dart';
import '../../core/helpers/asset_helper.dart';
import '../widgets/app_bar_container.dart';
import 'hotel_booking_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> listImageLeft = [
    {
      'name': 'Korea',
      'image': AssetHelper.imgKorea,
    },
    {
      'name': 'Dubai',
      'image': AssetHelper.imgDubai,
    },
    {
      'name': 'Korea',
      'image': AssetHelper.imgKorea,
    },
    {
      'name': 'Dubai',
      'image': AssetHelper.imgDubai,
    },
    {
      'name': 'Korea',
      'image': AssetHelper.imgKorea,
    },
    {
      'name': 'Dubai',
      'image': AssetHelper.imgDubai,
    }
  ];

  final List<Map<String, String>> listImageRight = [
    {
      'name': 'Turkey',
      'image': AssetHelper.imgTurkey,
    },
    {
      'name': 'Japan',
      'image': AssetHelper.imgJapan,
    },
    {
      'name': 'Turkey',
      'image': AssetHelper.imgTurkey,
    },
    {
      'name': 'Japan',
      'image': AssetHelper.imgJapan,
    },
    {
      'name': 'Turkey',
      'image': AssetHelper.imgTurkey,
    },
    {
      'name': 'Japan',
      'image': AssetHelper.imgJapan,
    }
  ];

  Widget _buildImageHomeScreen(String name, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HotelBookingScreen.routeName, arguments: name);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: kDefaultPadding),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ImageHelper.loadFromAsset(
              image,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              radius: BorderRadius.circular(kItemPadding),
            ),
            const Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Positioned(
              left: kDefaultPadding,
              bottom: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyles.defaultStyle.bold.whiteTextColor,
                  ),
                  const SizedBox(
                    height: kItemPadding,
                  ),
                  Container(
                    padding: const EdgeInsets.all(kMinPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMinPadding),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.star,
                          color: Color(0xffFFC107),
                        ),
                        SizedBox(
                          width: kItemPadding,
                        ),
                        Text('4.5')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidgets(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
            const TextField(
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
            const SizedBox(
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
                      Navigator.of(context)
                          .pushNamed(HotelBookingScreen.routeName);
                    },
                  ),
                ),
                const SizedBox(
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
                const SizedBox(
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
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            Row(
              children: [
                const Text(
                  'Popular Destinations',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  'See All',
                  style: TextStyles.defaultStyle.bold.primaryTextColor,
                ),
              ],
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: listImageLeft
                            .map((e) =>
                                _buildImageHomeScreen(e['name']!, e['image']!))
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: kDefaultPadding),
                    Expanded(
                        child: Column(
                      children: listImageRight
                          .map((e) =>
                              _buildImageHomeScreen(e['name']!, e['image']!))
                          .toList(),
                    )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
