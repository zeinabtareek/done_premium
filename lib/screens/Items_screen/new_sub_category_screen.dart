import 'package:cached_network_image/cached_network_image.dart';
import 'package:done_premium/componants/dialog.dart';
import 'package:done_premium/constants/app_common_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../componants/appbar.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_color.dart';
import '../search_screen/search_screen.dart';
import 'controller/new_sub_cat_controller.dart';
import 'dart:ui' as ui;

class NewSubCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewSubCategoryController());

    return  Scaffold(
      appBar: ArrowsAppBar(
        isFilter: true,
        isSearched: false, searchIcon: true,
      ),
      body: Column(
        children: [
        Card(
        elevation: 4,
        child: SizedBox(
          height: 250.h,
          width: 170.w,
          child: Column(
            children: [
                 Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgfniPXV8hfew58JR3sg71MJbeA3-W1JWd9RXLfd8rAw&s',

            fit: BoxFit.cover,

              ),
                Text(
                      'Title',
                      style: Common.textCardStyleB
                    )


            ],
          ),
          ),
          ),


        ],
      ),
    );
  }
}
