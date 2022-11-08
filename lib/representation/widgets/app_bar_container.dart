import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_contants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class AppBarContainerWidgets extends StatelessWidget {
  const AppBarContainerWidgets({
    Key? key,
    required this.child,
    this.title,
    this.titleString,
    this.implementLeading = false,
    this.implementTrailing = false,
  }) : super(key: key);
  final Widget child;
  final Widget? title;
  final String? titleString;
  final bool implementLeading;
  final bool implementTrailing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              title: title ??
                  Row(
                    children: [
                      // <-- Condition display icon Back -->
                      if (implementLeading)
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(kDefaultPadding),
                              ),
                              color: Colors.white),
                          padding: const EdgeInsets.all(kItemPadding),
                          child: const Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.black,
                            size: kDefaultIconSize,
                          ),
                        ),

                      // <-- Display Title -->
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                titleString ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // <-- Condition display icon Menu -->
                      if (implementTrailing)
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(kDefaultPadding),
                            ),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(kItemPadding),
                          child: const Icon(
                            FontAwesomeIcons.bars,
                            color: Colors.black,
                            size: kDefaultIconSize,
                          ),
                        )
                    ],
                  ),

              // <-- Display gradient background -->
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: ImageHelper.loadFromAsset(AssetHelper.imgOval1),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ImageHelper.loadFromAsset(AssetHelper.imgOval2),
                  )
                ],
              ),
            ),
          ),

          // <-- Display child item -->
          Container(
            margin: const EdgeInsets.only(top: 156),
            padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: child,
          )
        ],
      ),
    );
  }
}
