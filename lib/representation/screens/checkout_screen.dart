import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_contants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/data/models/room_model.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/item_optional_widget.dart';
import 'package:travel_app/representation/widgets/item_room_boking_widget.dart';

import '../widgets/button_widget.dart';
import 'main_app.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({
    Key? key,
    required this.roomModel,
  }) : super(key: key);

  static const String routeName = '/check_out_screen';
  final RoomModel roomModel;

  List<String> listStep = ['Book and Review', 'Payment', 'Confirm'];

  Widget _buildItemStepCheckout(
      int step, String stepName, bool isEnd, bool isCheck) {
    return Row(
      children: [
        Container(
          width: kMediumPadding,
          height: kMediumPadding,
          decoration: BoxDecoration(
            color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(kMediumPadding),
          ),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyle(color: isCheck ? Colors.black : Colors.white),
          ),
        ),
        const SizedBox(width: kMinPadding),
        Text(
          stepName,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        const SizedBox(width: kMinPadding),
        if (!isEnd)
          const SizedBox(
            width: kDefaultPadding,
            // * Divider:  Draw A thin horizontal line
            child: Divider(
              height: 1,
              thickness: 2,
              color: Colors.white,
            ),
          ),
        if (!isEnd) const SizedBox(width: kMinPadding)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidgets(
      implementLeading: true,
      titleString: 'Checkout',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: listStep
                .map(
                  (e) => _buildItemStepCheckout(
                    listStep.indexOf(e) + 1,
                    e,
                    listStep.indexOf(e) == listStep.length - 1,
                    listStep.indexOf(e) == 0,
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ItemRoomBookingWidget(
                    roomModel: roomModel,
                    numberOfRoom: 1,
                    onTap: () {},
                  ),
                  const ItemOptionalWidget(
                    icon: AssetHelper.iconContact,
                    title: 'Contact Details',
                    subTitle: 'Add contact',
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  const ItemOptionalWidget(
                    icon: AssetHelper.iconPromoCode,
                    title: 'Promo Code',
                    subTitle: 'Add promo code',
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  ButtonWidget(
                    title: 'Payment',
                    onTap: () {
                      // * Navigate to the main app when user click Payment button
                      Navigator.of(context).popUntil(
                          (route) => route.settings.name == MainApp.routeName);
                    },
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
