

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool isFilterVisible = false.obs;
  final  textEditingController=TextEditingController();

  void toggleFilterVisibility() {
    isFilterVisible.value = !isFilterVisible.value;
  }
}