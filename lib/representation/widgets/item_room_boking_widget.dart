import 'package:flutter/material.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/models/room_model.dart';
import 'package:travel_app/representation/widgets/item_utility_hotel_widget.dart';

import '../../core/constants/dimension_contants.dart';
import 'button_widget.dart';
import 'dashline_widget.dart';

class ItemRoomBookingWidget extends StatelessWidget {
  const ItemRoomBookingWidget({
    Key? key,
    required this.roomModel,
    required this.onTap,
    this.numberOfRoom,
  }) : super(key: key);

  final RoomModel roomModel;
  final Function()? onTap;
  final int? numberOfRoom;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(kItemPadding),
        ),
      ),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomModel.roomName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: kItemPadding,
                  ),
                  Text('Room Size: ${roomModel.roomSize}m2'),
                  const SizedBox(
                    height: kItemPadding,
                  ),
                  Text(roomModel.roomUtility),
                ],
              ),
              const Spacer(),
              ImageHelper.loadFromAsset(
                roomModel.roomImage,
                radius: const BorderRadius.all(
                  Radius.circular(kMinPadding),
                ),
              ),
            ],
          ),
          ItemUtilityHotelWidget(),
          DashLineWidget(),
          numberOfRoom == null
              ? Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${roomModel.roomPrice}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          const SizedBox(
                            height: kMinPadding,
                          ),
                          const Text('/night'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        title: 'Choose',
                        onTap: onTap,
                      ),
                    )
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            '\$${roomModel.roomPrice}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          const SizedBox(
                            width: kMinPadding,
                          ),
                          const Text('/night'),
                        ],
                      ),
                    ),
                    Text('${numberOfRoom} room')
                  ],
                )
        ],
      ),
    );
  }
}
