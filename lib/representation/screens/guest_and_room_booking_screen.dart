import 'package:flutter/material.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/widgets/item_add_guest_and_room_widget.dart';

import '../../core/constants/dimension_contants.dart';
import '../widgets/app_bar_container.dart';
import '../widgets/button_widget.dart';

class GuestAndRoomBookingWidget extends StatefulWidget {
  const GuestAndRoomBookingWidget({Key? key}) : super(key: key);

  static const String routeName = '/guest_room_booking_screen';

  @override
  State<GuestAndRoomBookingWidget> createState() =>
      _GuestAndRoomBookingWidgetState();
}

class _GuestAndRoomBookingWidgetState extends State<GuestAndRoomBookingWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidgets(
      implementLeading: true,
      titleString: 'Add guest and room',
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 2,
          ),
          ItemAddGuestAndRoom(
              title: 'Guest', icon: AssetHelper.iconGuest, initData: 2),
          ItemAddGuestAndRoom(
              title: 'Guest', icon: AssetHelper.iconBed, initData: 1),
          ButtonWidget(
            title: 'Select',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
              title: 'Cancel',
              onTap: () {
                Navigator.of(context).pop();
              })
        ],
      ),
    );
  }
}
