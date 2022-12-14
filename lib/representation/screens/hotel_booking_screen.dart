import 'package:flutter/material.dart';
import 'package:travel_app/core/extensions/date_ext.dart';
import 'package:travel_app/representation/screens/guest_and_room_booking_screen.dart';
import 'package:travel_app/representation/screens/hotels_screen.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import '../../core/constants/dimension_contants.dart';
import '../../core/helpers/asset_helper.dart';
import '../widgets/app_bar_container.dart';
import '../widgets/button_widget.dart';
import '../widgets/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key, this.nameDestination}) : super(key: key);
  final String? nameDestination;
  static const String routeName = '/hotel_booking_screen';

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidgets(
      implementLeading: true,
      titleString: 'Hotel Booking',

      // * Create list view
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBookingWidget(
              icon: AssetHelper.iconLocation,
              title: 'Destination',
              description: widget.nameDestination ?? 'Destination',
              onTap: () {},
            ),
            const SizedBox(
              height: kMediumPadding,
            ),

            // * StatefulBuilder: only render ItemBookingWidget if dateSelected have data  */
            StatefulBuilder(builder: (context, setState) {
              return ItemBookingWidget(
                icon: AssetHelper.iconCalendar,
                title: 'Select Date',
                description: dateSelected ?? '13 Feb - 18 Feb 2021',
                onTap: () async {
                  final result = await Navigator.of(context)
                      .pushNamed(SelectDateScreen.routeName);

                  // * Check result data has no null value */
                  if (!(result as List<DateTime?>)
                      .any((element) => element == null)) {
                    dateSelected =
                        '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                    setState(() {});
                  }
                },
              );
            }),
            const SizedBox(
              height: kMediumPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.iconRoom,
              title: 'Guest and Room',
              description: '2 Guest, 1 Room',
              onTap: () {
                Navigator.of(context)
                    .pushNamed(GuestAndRoomBookingWidget.routeName);
              },
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Search',
              onTap: () {
                Navigator.of(context).pushNamed(HotelsScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
