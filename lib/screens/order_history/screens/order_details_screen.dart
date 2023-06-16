
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../componants/cart_ingrendiant.dart';
import '../../../constants/app_color.dart';
import '../../../helper/shared_prefrences.dart';
import '../model/order_model.dart';


class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({Key? key, required this.order}) : super(key: key);
  late final Order order;
  final translateName = CacheHelper.getData(key:"localeIsArabic");



   @override
  Widget build(BuildContext context) {


     final landScape =
         MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      // appBar: ArrowsAppBar('orders'.tr),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: ScreenUtil().screenWidth,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // itemCount: con.list.length,
                    itemCount: order.listOfProduct!.length,
                    itemBuilder: (context, index) {



                      return Padding(
                          padding:
                          const EdgeInsets
                              .only(
                              bottom: 18.0),
                          child: Directionality(
                            textDirection:
                            translateName
                                ? TextDirection
                                .ltr
                                : TextDirection
                                .rtl,
                            child: Card(
                              elevation: 5,
                              color: mainColor,
                              shadowColor:
                              mainColor,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color:
                                      mainColor,
                                      width: 3),
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      15)),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .start,
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [
                                  Expanded(
                                    child:
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          "${order.listOfProduct![index].name}".tr
                                              .toUpperCase(),
                                          style:
                                          TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),
                                        ),
                                        Directionality(
                                          textDirection: translateName
                                              ? TextDirection.ltr
                                              : TextDirection.rtl,
                                          child:
                                          Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(color: Colors.white, borderRadius: translateName ?
                                                BorderRadius.only(bottomRight: Radius.circular(15)) : BorderRadius.only(bottomLeft: Radius.circular(15))),
                                                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                                  CartIngrediantRow(
                                                      textKey: 'price'.tr,
                                                      widget: Text(
                                                          "${order.listOfProduct![index].price}".tr,
                                                        style: TextStyle(fontSize: 12.sp),
                                                      )),

                                                  Divider(
                                                    thickness: .7,
                                                    height: 2,
                                                    color: Colors.grey,
                                                  ),



                                                  CartIngrediantRow(
                                                    textKey: 'quantity'.tr,
                                                    widget:
                                                        Text(
                                                          "${order.listOfProduct![index].quantity}".tr,
                                                          style: TextStyle(fontSize: 12.sp),
                                                        ),

                                                  ),

                                                  Divider(
                                                    thickness: .7,
                                                    height: 2,
                                                    color: Colors.grey,
                                                  ),


                                                  CartIngrediantRow(
                                                    textKey: 'total'.tr,
                                                    widget: Row(
                                                      children: [
                                                        Text(
                                                          "${order.listOfProduct![index].price}".tr,
                                                          style: TextStyle(fontSize: 12.sp),
                                                        ),
                                                        Text(
                                                          'coin_jordan'.tr,
                                                          style: TextStyle(fontSize: 12.sp),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    thickness: .7,
                                                    height: 2,
                                                    color: Colors.grey,
                                                  ),

                                                  Directionality(textDirection:
                                                  translateName?TextDirection.rtl:TextDirection.ltr,
                                                    child: Container(  padding:EdgeInsets.only(top:10.h,bottom:10.h),
                                                      child: (order.listOfProduct![index].message)!=''?
                                                      Text(
                                                        '${order.listOfProduct![index].message}'.tr,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),):
                                                      Text('No Messages',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                                                    ),
                                                  ),


                                                ]),


                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft:
                                            Radius.circular(15),
                                            bottomLeft: Radius.circular(15)),
                                        child:
                                        CachedNetworkImage(
                                          height:
                                          120.h,
                                          width:
                                          150.w,
                                          imageUrl:
                                          "${order.listOfProduct![index].photo}" ?? "",
                                          fit: BoxFit
                                              .cover,
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                                Icons.image_not_supported_sharp,
                                                size:
                                                60,
                                                color:
                                                kPrimaryColor.withOpacity(0.6),
                                              ),
                                        ),
                                      ),
                                      Container(    child: Text(
                                          ' Massages'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ));


                    }),
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: mainColor,
                ),
                child: Padding(
                  padding:   EdgeInsets.only(left: 8.0.w,right: 8.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text("${'total'.tr} : ",
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold)),
                          Text(order.totalPrice.toString(),
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  color: Colors.red.shade700,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${'user_name'.tr} :" ,style: TextStyle(fontSize: 18.sp),),
                          Text('${order.client!.name.toString()}',style: TextStyle(fontSize: 18.sp),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${'user_phone'.tr} :',style: TextStyle(fontSize: 18.sp),),
                          Text('${order.client!.phone.toString()}',style: TextStyle(fontSize: 16.sp),),
                        ],
                      ),
                      order.address != null
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${'deliver_to'.tr} :',style: TextStyle(fontSize: 18.sp),),
                                Text('${order.address!.address}',style: TextStyle(fontSize: 16.sp),),
                              ],
                            )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${'receive_from'.tr} :',style: TextStyle(fontSize: 14.sp),),
                                Text('${order.branch!}',style: TextStyle(fontSize: 14.sp),),
                              ],
                            ),


                    ],
                  ),
                ),
              ),

              /**********************************************the End********************************************************/
            ],

        ),
        ),
        ),

    );
  }
}

