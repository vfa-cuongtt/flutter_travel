import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_contants.dart';
import 'package:travel_app/data/models/hotel_model.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';
import '../widgets/button_widget.dart';
import '../widgets/dashline_widget.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({Key? key, required this.hotelModel})
      : super(key: key);

  static const String routeName = '/hotel_detail_screen';

  final HotelModel hotelModel;

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
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.hotelModel.hotelName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '\$${widget.hotelModel.price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(
                                width: kMinPadding,
                              ),
                              const Text(
                                ' /night',
                                style: TextStyle(
                                  color: ColorPalette.subTitleColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(
                                AssetHelper.iconPinLocation,
                              ),
                              const SizedBox(
                                width: kDefaultPadding,
                              ),
                              Text(widget.hotelModel.location)
                            ],
                          ),
                          const SizedBox(
                            height: kMinPadding,
                          ),
                          const DashLineWidget(),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(AssetHelper.iconStar),
                              const SizedBox(
                                width: kDefaultPadding,
                              ),
                              Text('${widget.hotelModel.star}/5'),
                              Text(
                                ' (${widget.hotelModel.numberOfReview} reviews)',
                                style: const TextStyle(
                                  color: ColorPalette.subTitleColor,
                                ),
                              )
                            ],
                          ),
                          const DashLineWidget(),
                          const Text(
                            'Information',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: kDefaultPadding),
                          const Text(
                            '''You will find every comfort because many of the 
services that the hotel offers for travellers and of
course the hotel is very comfortable.''',
                          ),
                          const SizedBox(height: kDefaultPadding),
                          const Text(
                            'Location',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: kDefaultPadding),
                          const Text(
                            '''Located in the famous neighborhood of Seoul, 
Grand Luxury’s is set in a building built in the 
2010s.''',
                          ),
                          const SizedBox(height: kDefaultPadding),
                          ImageHelper.loadFromAsset(AssetHelper.imgMapHotel),
                          const SizedBox(height: kDefaultPadding),
                          ButtonWidget(
                            title: 'Select room',
                            onTap: () {},
                          )
                        ],
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
