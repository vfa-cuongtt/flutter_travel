import 'package:flutter/material.dart';
import '../../core/constants/dimension_contants.dart';
import '../../core/helpers/asset_helper.dart';
import '../widgets/app_bar_container.dart';
import '../widgets/button_widget.dart';
import '../widgets/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  static const String routeName = '/hotel_booking_screen';

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidgets(
      titleString: 'Hotel Booking',
      // Create list view
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBookingWidget(
              icon: AssetHelper.iconLocation,
              title: 'Destination',
              description: 'South Korea',
              onTap: () {},
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.iconCalendar,
              title: 'Select Date',
              description: '13 Feb - 18 Feb 2021',
              onTap: () {},
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.iconRoom,
              title: 'Guest and Room',
              description: '2 Guest, 1 Room',
              onTap: () {},
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Search',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
