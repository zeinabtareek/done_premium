
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../componants/custom_btn.dart';
import '../../componants/dialog.dart';
import '../../componants/pin_code_field.dart';
import 'controller/signup_controller.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key, required this.verification,required this.name,required this.phone}) : super(key: key);
  final  signUpController = Get.put(SignUpController());
String verification;
String name;
String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 50.h,
                ) ,

                Image.asset(
                  "assets/images/check-mark.png",

                  width: 180.w,
                  height: 180.h,
                ),
                SizedBox(
                  height: 100.h,
                ),
                Center(
                  child: PinCodeField(
                    textEditingController:
                    signUpController.pinTextEditingController,
                  ),
                ),
                 Button(
                   isFramed: false,
                   height: Get.height/20.h,
                   fontSize: 14,
                   size: 250,
                    text: "confirm_user".tr,
                    onPressed: () async {
                      // try{
                      //   showDialog1(context);
                      //   await signUpController.verifyCode(verification,name,phone);
                      // }on FirebaseException catch(error){
                      //   if(error == 'FIRAuthErrorCodeNetworkError'){
                      //     Get.defaultDialog(content: Text('Network Connection error '),);
                      //   }else{
                      //     Get.back();
                      //     // Get.defaultDialog(content: Text('$error'.tr), title: 'error'.tr);
                      //     Get.defaultDialog(content: Text('wrong_code'.tr), title: 'error'.tr);
                      //   }
                      // }
                    }),
                Button(
                  isFramed: true,
                  height: Get.height/20.h,
                  fontSize: 14,
                  size: 250,
                    text: "resend_code".tr,
                    onPressed: () async {
                      showDialog1(context);
                      await signUpController.sendVerificationCode(name:name ,phone:phone );
                    }),
               ],
            ),
          ),
        ),
      ),
    );
  }
}
