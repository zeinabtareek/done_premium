import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';


class Common {

  static BoxDecoration customBoxDecoration= BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: mainColor,
        width: 1,
      ));

  static final sizedBoxW=SizedBox(width: 15.w,);
  static final sizedBoxH=SizedBox(height: 15.h,);
  static final focusedBorder= OutlineInputBorder(
    borderSide: BorderSide(
      color: mainColor,
    ),
    borderRadius: BorderRadius.circular(8.r),
  );  static final focusedBorderRounded= OutlineInputBorder(
    borderSide: BorderSide(
      color: mainColor,
     ),
    borderRadius: BorderRadius.circular(50.r),
  );


  static final greyBorder= OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide(
      color: greyColor,
    ),
  );static final whiteBoxDecoration= BoxDecoration(
    border: Border.all(
      color: whiteColor.withOpacity(.5),
      width: 1,
    ),
    borderRadius: BorderRadius.circular(5.0),
  );
  static final decoration= BoxDecoration(
    borderRadius:
    BorderRadius.circular(15.r),
    color: Colors.transparent,
  );
 static final textCardStyleB= TextStyle(
   color: kPrimaryColor,
   fontSize: 22.sp,
   fontWeight: FontWeight.bold,
 );
 static final textRedAppBarTitle=  TextStyle(color: mainColor,fontSize: 20,fontWeight: FontWeight.bold,);
 static final textWhiteTitle=  TextStyle(color: whiteColor,fontSize: 20,fontWeight: FontWeight.bold,);
 static final greyText= TextStyle(color: greyColor,fontWeight: FontWeight.bold);

}