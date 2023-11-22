// ignore_for_file: unnecessary_null_comparison

import 'package:customcalendar/Components/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customCalendar extends StatefulWidget {
  final int dateShow;
  final String selectedValue;
  // final Function(String) updateDaysToShow;
  customCalendar(
      {super.key, required this.dateShow, required this.selectedValue});
  @override
  _customCalendarState createState() => _customCalendarState();
}

class _customCalendarState extends State<customCalendar> {
  @override
  Widget build(BuildContext context) {
    // final int daysToShow = int.parse(widget.dateShow.toString());

    // int daysToShow = 7; // Initialize with a default value
    // if (widget.dateShow.text.isNotEmpty) {
    //   daysToShow = int.parse(widget.dateShow.text);
    // }

    List<DateTime> dateList = [];
    DateTime currentDate = DateTime.now();
    for (int i = 0; i < widget.dateShow; i++) {
      dateList.add(currentDate.add(Duration(days: i)));
    }

    return SizedBox(
      height: 80.h,
      width: MediaQuery.of(context).size.width.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dateList.length,
        itemBuilder: (context, index) {
          final date = dateList[index];
          return DateItem(
            SelectedValue: widget.selectedValue,
            date: date,
          );
        },
      ),
    );
  }
}

class DateItem extends StatefulWidget {
  final DateTime date;
  final SelectedValue;

  DateItem({required this.date, required this.SelectedValue});

  @override
  State<DateItem> createState() => _DateItemState();
}

class _DateItemState extends State<DateItem> {
  DateTime? selectedDate;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (widget.date == selectedDate) {
              isSelected = false;
              selectedDate = null;
            } else {
              isSelected = true;
              selectedDate = widget.date;
              print(widget.date.toString());
            }
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: isSelected ? Color.fromARGB(255, 214, 36, 36) : white,
              border: Border.all(
                  color: isSelected
                      ? Color.fromARGB(255, 214, 36, 36)
                      : grey.shade100,
                  width: 1.5.r)),
          child: Column(
            children: [
              SizedBox(
                height: 12.h,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    '${getMonthName(widget.date.month)}'.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 20.h,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    '${widget.date.day}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 12.h,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    '${getWeekday(widget.date.weekday)}'.toUpperCase(),
                    style: TextStyle(
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w400,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
