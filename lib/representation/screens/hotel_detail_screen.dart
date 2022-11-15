import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/dimension_contants.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({Key? key}) : super(key: key);

  static const String routeName = '/hotel_detail_screen';

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // * Fill image full screen width BoxFit.fill
          Positioned.fill(
            child: ImageHelper.loadFromAsset(
              AssetHelper.imgDetailHotel1,
              fit: BoxFit.fill,
            ),
          ),

          // * Define button back
          Positioned(
            top: kMediumPadding * 3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(kItemPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(kDefaultPadding),
                  ),
                ),
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: kDefaultIconSize,
                ),
              ),
            ),
          ),

          // * Define button back and favorite icon
          Positioned(
            top: kMediumPadding * 3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(kItemPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(kDefaultPadding),
                  ),
                ),
                child: const Icon(FontAwesomeIcons.solidHeart,
                    color: Colors.red, size: kDefaultIconSize),
              ),
            ),
          ),

          // * Define drag and scroll item
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.8,
            minChildSize: 0.3,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  children: [
                    // * Define drag icon
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: kDefaultPadding),
                      height: 5,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(kItemPadding),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),

                    // * Define list of items
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
