import 'package:done_premium/constants/app_common_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../componants/custom_image.dart';
import '../../constants/app_color.dart';
import '../home_screen/home_screen.dart';
import 'controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      key: controller.scaffoldKey,
      body:   Obx(()=>controller.bodyScreens[controller.currentIndex.value]
      //     HomeScreen(
      //     subCategories: controller.showBottomNavBarIconsList,
      //   indexx:controller.currentIndex.value
      //
      // ),
      ),

      bottomNavigationBar:
        Container(
          padding: EdgeInsets.only(bottom: 5.h),
          margin: EdgeInsets.only(bottom: 10.h),
          width: double.infinity,
          height: 80.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
         GetBuilder<HomeController>(
           init:HomeController() ,
              builder:(controller)=>     ListView.builder(
                          // itemCount: 5,
                          itemCount: controller.showBottomNavBarIconsList.length ,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return   customBottomNavBarIcon(onTap: () async {
                              controller.changeTabIndex(index);
                             },
                                currentIndex: controller.currentIndex.value ==
                                    index,
                              photo: controller.showBottomNavBarIconsList[index].photo.toString(),
                              name:
                              "${controller.showBottomNavBarIconsList[index].name}"
                                  .tr,
                              photoFilled: controller.showBottomNavBarIconsList[index].photoFilled.toString(),

                            );

                          })
         )
                  ]))

      // )
    );
  }
}
customBottomNavBarIcon({onTap,currentIndex,photo,photoFilled,name ,color}){
  return Container(
      width: 80.w,
      padding: EdgeInsets.only(top: 5.h),
      decoration: Common.decoration,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           currentIndex
                ? ShowUpAnimation(
                animationDuration:
                const Duration(
                    milliseconds:
                    200),
                child:
                Image.asset( photoFilled,
                  height: 30,
                  width: 30,
                  fit: BoxFit.contain,

                )
            )
                :
            Image.asset(photo,
              height: 30,
              width: 20,
              fit: BoxFit.contain,
            ),
            ShowUpAnimation(
              animationDuration:
              const Duration(
                  milliseconds: 200),
              child: Text(name,
                  style: TextStyle(
                      color:  currentIndex
                          ? mainColor
                          : Colors.black,
                      fontSize: 12.sp)),
            )
          ],
        ),
      )

  );
}