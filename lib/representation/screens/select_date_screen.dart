import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_contants.dart';
import '../widgets/app_bar_container.dart';
import '../widgets/button_widget.dart';

class SelectDateScreen extends StatelessWidget {
  static const String routeName = '/select_date_screen';
  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidgets(
      implementLeading: true,
      titleString: 'Select Date',
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding * 1.5,
          ),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings:
                const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalette.yellowColor,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              } else {
                rangeStartDate = null;
                rangeEndDate = null;
              }
            },
          ),
          ButtonWidget(
            title: 'Select',
            onTap: () {
              if (rangeStartDate != null && rangeEndDate != null) {
                Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Cancel',
            onTap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
            opacity: ColorPalette.primaryColor.withOpacity(0.1),
          )
        ],
      ),
    );
  }
}
