import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/font_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.0.h,
      ),
      child: Row(
        children: [
          Container(
              width: 43.0.w,
              height: 43.0.h,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(60.r)),
              child: const BackButton(
                color: Colors.black,
              )),
          Container(
            margin: EdgeInsets.only(left: 85.w),
            child: Text(
              'Schedule',
              style: blackTextStyle.copyWith(
                fontSize: 20.sp,
              ),
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
