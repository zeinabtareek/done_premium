import 'package:done_premium/constants/app_common_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../componants/custom_btn.dart';
import '../../constants/app_color.dart';
class BranchesScreen extends StatelessWidget {
  const BranchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text('choose_branch_drop_down'.tr,style: TextStyle(color: mainColor,fontSize: 22.sp),),
        elevation: 3,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Common.sizedBoxH,
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return index != 0
                    ? Button(
                  height: 80.h,fontSize: 25.sp,
                  size: 100,
                  text:  'Main branch'.tr,
                  isFramed: false,
                  onPressed: () async {   },
                )
                    : Container();
              }),
        ],
      ),
    );
  }
}
