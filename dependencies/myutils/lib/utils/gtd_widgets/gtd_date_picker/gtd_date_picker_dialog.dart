library dialog_itinerary;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myutils/data/configuration/color_config/app_color.dart';
import 'package:myutils/helpers/extension/colors_extension.dart';
import 'package:myutils/helpers/extension/icon_extension.dart';
import 'package:myutils/utils/gtd_widgets/gtd_button.dart';
import 'package:myutils/utils/gtd_widgets/gtd_date_picker/date_picker_manager.dart';
import 'package:myutils/utils/gtd_widgets/gtd_date_picker/model/DateTimeRes.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'gtd_date_picker.dart';

typedef OnTapCallback = void Function(DateTimeRes newValue);
typedef OnSelectDate = void Function(DateTimeRes newValue);

class GtdDatePickerDialog extends StatefulWidget {
  /// Space between the buttons and the text */
  final OnTapCallback? onPressed;
  final OnSelectDate? onSelected;
  final String titleHeading;
  final bool isSingleDate;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? minDate;
  final DateTime? maxDate;

  const GtdDatePickerDialog({
    Key? key,
    this.onPressed,
    this.onSelected,
    this.startDate,
    this.endDate,
    this.minDate,
    this.maxDate,
    required this.titleHeading,
    required this.isSingleDate,
  }) : super(key: key);
  @override
  GtdDatePickerState createState() => GtdDatePickerState();
}

class GtdDatePickerState extends State<GtdDatePickerDialog> {
  late final DateRangePickerController _controller = DateRangePickerController();
  late DateTime? _start, _end, _minDate;
  late final DateRangePickerSelectableDayPredicate? selectableDayPredicate;
  DateTime? fromDate;
  DateTime? toDate;

  @override
  void initState() {
    _controller.displayDate = widget.startDate;
    _minDate = widget.minDate;
    _start = fromDate = widget.startDate;
    _end = toDate = widget.endDate;
    if (!widget.isSingleDate) {
      _controller.selectedRange = PickerDateRange(_start, _end);
    } else {
      _controller.selectedDate = _start;
    }

    scrollController = ScrollController(
      keepScrollOffset: true,
      debugLabel: 'pageBodyScroll',
    );
    if (fromDate != null && toDate == null && !widget.isSingleDate) {
      _minDate = fromDate!;
    } else {
      _minDate = DateTime.now();
    }
    super.initState();
  }

  TextEditingController controllerSearch = TextEditingController();
  late final ScrollController scrollController;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    DateTimeRes dateTimeRes;
    return SfDateRangePickerTheme(
      data: SfDateRangePickerThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        viewHeaderTextStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w600, fontSize: 12),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                ListTile(
                  title: Text(widget.titleHeading,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                  leading: const SizedBox(width: 30),
                  trailing: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: Container(
                      width: 30,
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Icon(
                        Icons.close,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                !widget.isSingleDate
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(18),
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.shade50),
                              child: Wrap(
                                runSpacing: 10,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GtdAppIcon.iconNamedSupplier(iconName: "calendar-grey.svg"),
                                      Expanded(
                                          child: GtdAppIcon.iconNamedSupplier(iconName: 'flight/line-itinerary.svg')),
                                      GtdAppIcon.iconNamedSupplier(iconName: "calendar-grey.svg"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Ngày đi', style: TextStyle(color: Colors.grey.shade600)),
                                            const SizedBox(height: 5),
                                            Text(fromDate != null ? dateFormat.format(fromDate!) : '--',
                                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text('Ngày về', style: TextStyle(color: Colors.grey.shade600)),
                                            const SizedBox(height: 5),
                                            Text(toDate != null ? dateFormat.format(toDate!) : '--',
                                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
                Container(
                  height: MediaQuery.of(context).size.width * 2,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GtdDateRangePicker(
                    controller: _controller,
                    headerHeight: 32,
                    todayHighlightColor: Colors.grey.shade900,
                    enableMultiView: true,
                    showActionButtons: true,
                    minDate: _minDate,
                    rangeSelectionColor: AppColors.mainColor.shade50,
                    enablePastDates: false,
                    selectionMode:
                        !widget.isSingleDate ? DateRangePickerSelectionMode.range : DateRangePickerSelectionMode.single,
                    extendableRangeSelectionDirection: ExtendableRangeSelectionDirection.both,
                    toggleDaySelection: true,
                    viewSpacing: 0,
                    allowViewNavigation: true,
                    monthViewSettings: const DateRangePickerMonthViewSettings(
                      firstDayOfWeek: 1,
                    ),
                    onSelectionChanged: (valueChange) {
                      DateTimeRes dateTimeResChange = DateTimeRes();
                      setState(() {
                        if (!widget.isSingleDate) {
                          fromDate = valueChange.value.startDate;
                          toDate = valueChange.value.endDate;
                          dateTimeResChange.fromDate = fromDate;
                          dateTimeResChange.toDate = toDate;
                          if (fromDate != null && toDate == null) {
                            _minDate = fromDate!;
                          } else {
                            _minDate = DateTime.now();
                          }
                        } else {
                          fromDate = valueChange.value;
                          dateTimeResChange.fromDate = fromDate;
                        }
                        if (widget.onSelected != null) {
                          widget.onSelected!(dateTimeResChange);
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight - 30, top: 16, left: 16, right: 16),
            child: Row(
              children: [
                Expanded(
                    child: GtdButton(
                  onPressed: (a) => {
                    setState(() {
                      fromDate = null;
                      toDate = null;
                      if (!widget.isSingleDate) {
                        _controller.selectedRange = const PickerDateRange(null, null);
                      } else {
                        _controller.selectedDate = null;
                      }
                    })
                  },
                  text: 'Xóa',
                  height: 48,
                  color: Colors.white,
                  colorText: Colors.grey.shade900,
                  borderRadius: 24,
                  border: Border.all(color: Colors.grey.shade200, width: 2),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: GtdButton(
                        onPressed: (a) => {
                              dateTimeRes = DateTimeRes(),
                              dateTimeRes.fromDate = fromDate,
                              dateTimeRes.toDate = toDate,
                              if (widget.onPressed != null) widget.onPressed!(dateTimeRes)
                            },
                        text: "flight.filter.apply".tr(),
                        height: 48,
                        gradient: GtdColors.appGradient(context),
                        borderRadius: 24))
              ],
            ),
          )),
    );
  }
}
