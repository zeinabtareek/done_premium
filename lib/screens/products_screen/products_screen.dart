import 'package:done_premium/constants/app_color.dart';
import 'package:done_premium/constants/app_common_style.dart';
import 'package:done_premium/screens/products_screen/controller/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../componants/appbar.dart';
import '../../componants/custom_btn.dart';
import '../../componants/custom_image.dart';
import '../../constants/app_assets.dart';

class ProductsScreen extends StatelessWidget {
    ProductsScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: ArrowsAppBar(
        isSearched: false,
          searchIcon: true,
        title:'clothes'.tr,
        isFilter:true,
          filterIcon:IconButton(onPressed: controller.toggleFilterVisibility, icon: Icon(Icons.filter_alt_off_sharp,size: 30.sp,color: mainColor,),),
          icon:IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,size: 20.sp,color: mainColor,),)
      ),
        body: Stack(
          children: [
            Obx(() => AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: controller.isFilterVisible.value ? 0 : 180.h ,
              left: 0,
              right: 0,
              height:
              controller.isFilterVisible.value ? 180.h : 0,
              child: Column(
                children: [
                  Common.sizedBoxH,

                  // Container(
                  //   width: 100,
                  //   height: 100,
                  //   color: Colors.blue,
                  //   child: const Center(
                  //     child: Text(
                  //       'Filter Container',
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 24,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Row(
                    children: [
                      for(int i=0;i<2;i++)
                      Expanded(
                        child: Padding(
                          padding:   EdgeInsets.symmetric(horizontal: 16.0.w),
                          child: TextFormField(
                            cursorColor: greyColor,
                            controller: controller.textEditingController,
                            decoration: InputDecoration(
                              labelText: i==0?'from'.tr:'to'.tr,
                              labelStyle: Common.greyText,
                              hintText: '00.0',
                               border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              suffix: Text('egp'.tr, style: Common.greyText),
                               focusedBorder:Common.focusedBorder,
                              enabledBorder:Common.greyBorder,
                              disabledBorder:Common.greyBorder,

                              contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Button(
                            text: "save_results".tr,
                            onPressed: () async {  }, isFramed: false,
                            height:84.h,
                            fontSize: 22.sp,
                            size: 200.w,
                          icon2:Icon(Icons.check_circle,color: whiteColor,),

                          radius:50,

                        ),
                      ), Expanded(   child: Button(
                          text: "delete_results".tr,
                          onPressed: () async {  }, isFramed: true,
                          height:80.h,
                        radius:50,
                        icon2:Icon(Icons.cancel,color: mainColor,),
                          fontSize: 22.sp,
                          size: 200.w,

                      ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Obx(() => AnimatedPadding(
              duration: Duration(milliseconds: 500),
              padding: EdgeInsets.only(
                  top: controller.isFilterVisible.value ? 180.h  : 0),
              child: CustomProductsPaginationCard(
                name:'nameee' ?? "",
                image: 'kddk',
                price:'200',
                isSale: true,
                offer:'22',
                onAddToCartTap:(){},
                onAddToFavTap:(){},
              )
            )),
          ],
        ),

    );
  }
}


class CustomProductsPaginationCard extends StatelessWidget {
  const CustomProductsPaginationCard({
    Key? key,
    required this.name,
    required this.price,
    required this.offer,
    required this.image,
    required this.isSale,
    required this.onAddToCartTap,
    required this.onAddToFavTap,
  }) : super(key: key);

  final String name;
  final String price;
  final String offer;
  final String image;
  final bool isSale;
  final   Function() onAddToCartTap;
  final   Function() onAddToFavTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
            elevation: 5,
            color: whiteColor,
            shadowColor: mainColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: mainColor, width: 1),
                borderRadius:
                BorderRadius.circular(15.r)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      )
                  ),
                  padding:  EdgeInsets.all( 5.sp),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      // K.sizedBoxW,
                      InkWell(onTap: onAddToCartTap, child: Container(
                        padding:  EdgeInsets.all( 2),
                        decoration: Common.whiteBoxDecoration,
                        child:   Icon(
                          Icons.add_shopping_cart_outlined,
                          size: 25.0,
                          color: whiteColor,
                        ),
                      )

                      ),
                      Text(name,style: Common.textWhiteTitle,
                      ),
                      InkWell(onTap: onAddToFavTap, child: Icon(Icons.favorite_border,size: 30.sp,color: whiteColor,)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    CustomImage(image:image,
                      width: MediaQuery.of(context).size.width/3.w,
                      fit: BoxFit.cover,
                      height:  MediaQuery.of(context).size.height/6.h,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('price'.tr,style:Common.textCardStyleB
                                  .copyWith(fontWeight: FontWeight.w700)),
                              Text(price,style:Common.textCardStyleB//blackTextStyle
                                  .copyWith(fontWeight: FontWeight.w700)),
                              Text('egp'.tr,style:Common.textCardStyleB//blackTextStyle
                                  .copyWith(fontWeight: FontWeight.w700)),
                            ],
                          ),
                          Common.sizedBoxH,
                          isSale?  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('instead_of'.tr,style:Common.textRedAppBarTitle//blackTextStyle
                                  .copyWith(fontWeight: FontWeight.w600)),
                              CustomSlopText(text:  '${'  $offer.00'} ${'egp'.tr}',)
                            ],
                          ):SizedBox()
                        ],
                      ),
                    )
                  ],
                )
              ],
            )),
        isSale?Positioned(child: Image.asset(saleImage,width: 50.w,height: 60.h,),top: -5.h,right: 50.w,):SizedBox()

      ],
    );
  }
}
class CustomSlopText extends StatelessWidget {
  const CustomSlopText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.red
          ),
        ),
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Container(
            height: 1,
            width: 50,
            color: Colors.transparent,
            child: Transform.rotate(
              angle: -45 * 3.141592 / 290,
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
