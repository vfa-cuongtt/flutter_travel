import 'package:flutter/material.dart';
import 'package:travel_app/data/models/RoomModel.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import '../../core/helpers/asset_helper.dart';
import '../widgets/item_room_boking_widget.dart';

class SelectRoomScreen extends StatelessWidget {
  const SelectRoomScreen({Key? key}) : super(key: key);

  static const String routeName = '/select_room_screen';

  @override
  Widget build(BuildContext context) {
    final List<RoomModel> listRoom = [
      RoomModel(
        roomName: 'Deluxe Room',
        roomUtility: 'Free Cancellation',
        roomPrice: 245,
        roomImage: AssetHelper.imgRoom1,
        roomSize: 27,
      ),
      RoomModel(
        roomName: 'Executive Suite',
        roomUtility: 'Non-refundable',
        roomPrice: 289,
        roomImage: AssetHelper.imgRoom2,
        roomSize: 32,
      ),
      RoomModel(
        roomName: 'King Bed Only Room',
        roomUtility: 'Non-refundable',
        roomPrice: 214,
        roomImage: AssetHelper.imgRoom3,
        roomSize: 24,
      ),
    ];

    return AppBarContainerWidgets(
      implementLeading: true,
      titleString: 'Select Room',
      child: SingleChildScrollView(
        child: Column(
            children: listRoom
                .map((e) => ItemRoomBookingWidget(
                      roomModel: e,
                    ))
                .toList()),
      ),
    );
  }
}
