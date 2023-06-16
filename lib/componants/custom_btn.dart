import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/app_color.dart';

class Button extends StatelessWidget {
  final String text;
  double size=250;
  double height=300;
  double ? fontSize;
  double ? radius;
  final bool  isFramed ;
  final Widget? widget;
  final Widget? icon2;
  final VoidCallback? onPressed;

  Button({
    required this.text,
    required this.size,
    required this.height,
    required this.isFramed,
    this.onPressed,
    this.fontSize,
    this.icon2,
    this.widget,
    this.radius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final landScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return InkWell(
      onTap: onPressed,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,

      child:Container(
        width: size.w,
        height: height.h,
        margin: EdgeInsets.only(top: 10.h,bottom: 10.h,left: 10.w,right: 10.w),
        child: ElevatedButton(onPressed:onPressed,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(isFramed?whiteColor:mainColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius==null?10.0:radius!),
                        side: BorderSide(color: isFramed?mainColor:whiteColor,width: 2)
                    )
                )
            ), child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           icon2!=null?icon2!:SizedBox(),
            Text(text, style: TextStyle(color: isFramed?mainColor:whiteColor,fontSize: fontSize?.sp),),
          ],
        )
        ),
      ),
    );
  }
}
