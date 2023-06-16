import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_assets.dart';
import '../../Items_screen/new_sub_category_screen.dart';
import '../../cart_screen/cart_screen.dart';
import '../../home_screen/home_screen.dart';
import '../../more_info/more_info.dart';
import '../../order_history/screens/order_history_screen.dart';
import '../model/BottomNavModel.dart';

class HomeController extends GetxController{

  final GlobalKey<ScaffoldState> scaffoldKey =   GlobalKey<ScaffoldState>();
  final currentIndex = 2.obs;

  RxList<dynamic> showBottomNavBarIconsList=<BottomNavModel>[
    BottomNavModel(name: "category".tr, photo: menuIcon,photoFilled:menuFillIcon, ),
    BottomNavModel(name: "track_order".tr, photo: trackIcon,photoFilled:trackIcon),
    BottomNavModel(name: "home".tr, photo: homeIcon,photoFilled:homeFillIcon),
    BottomNavModel(name: "cart".tr, photo: cartIcon,photoFilled:cartFillIcon),
    BottomNavModel(name: "more".tr, photo: moreIcon,photoFilled:moreFilledIcon),
  ].obs;

  changeTabIndex(int index) {
    currentIndex.value = index;

    update();
  }
  final List bodyScreens = [
    NewSubCategoryScreen(),
    OrderHistoryScreen(),
    HomeScreen(subCategories: [].obs, indexx: 0,),
    CartScreen(),
    MoreInfoScreen(),
  ].obs;




}