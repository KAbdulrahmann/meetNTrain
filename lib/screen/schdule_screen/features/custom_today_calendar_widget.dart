import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../shared/colors.dart';
import '../../../shared/font_style.dart';

class CustomTodayCalendarWidget extends StatelessWidget {
  const CustomTodayCalendarWidget({Key? key, required this.date})
      : super(key: key);

  final DateTime date;
  @override
  Widget build(BuildContext context) {
    String dayNumber = DateFormat('dd').format(date);
    String dayName = DateFormat('EEEE').format(date);
    String monthAndYear = DateFormat('MMM y').format(date);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              SizedBox(
                height: 56.h,
                width: 50.w,
                child: Stack(
                  children: [
                    // for calender icon
                    Positioned(
                      left: 15.w,
                      bottom: 0,
                      top: 50.h,
                      child: Container(
                        width: 1.w,
                        color: Colors.black12,
                      ),
                    ),
                    Positioned(
                        left: 0.w,
                        top: 10.h,
                        child: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                // color: mainColor,
                                border:
                                    Border.all(width: 3.w, color: mainColor),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: const Icon(
                              Icons.calendar_today_outlined,
                              color: mainColor,
                            )))
                  ],
                ),
              ),
              // for calender date
              Expanded(
                child: SizedBox(
                  width: 95.0.w,
                  height: 56.0.h,
                  child: Row(
                    children: <Widget>[
                      Text(
                        dayNumber,
                        style: blackTextStyle.copyWith(fontSize: 40.sp),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Align(
                        alignment: const Alignment(0, 0.2),
                        child: SizedBox(
                          width: 60.0.w,
                          height: 37.0.h,
                          child: Stack(
                            children: <Widget>[
                              Text(dayName,
                                  style: blackWithHalfOpacityTextStyle.copyWith(
                                      fontSize: 13.sp)),
                              Positioned(
                                bottom: 0,
                                child: Text(monthAndYear,
                                    style: blackTextStyle.copyWith(
                                        fontSize: 13.sp)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
