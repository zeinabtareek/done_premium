import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../branches_screen/branches_screen.dart';

class LoadingController extends GetxController {


  Timer ?timer;
  @override
  void dispose() {

    timer!.cancel();
     super.dispose();
  }

  @override
  onInit()async{
    startTimer();

     super.onInit();
  }

  startTimer() {
    timer=Timer(const Duration(seconds: 3), () async {
      Get.offAll(BranchesScreen());
     });
  }




}
