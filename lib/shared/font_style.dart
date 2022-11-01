import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

TextStyle blackTextStyle = GoogleFonts.poppins(
  fontSize: 11.0.sp,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

TextStyle mainColorTextStyle = GoogleFonts.poppins(
  fontSize: 10.0.sp,
  color: mainColor,
  fontWeight: FontWeight.w600,
);

TextStyle blackWithHalfOpacityTextStyle = GoogleFonts.poppins(
  fontSize: 11.0.sp,
  color: Colors.black.withOpacity(0.5),
  fontWeight: FontWeight.w600,
);
