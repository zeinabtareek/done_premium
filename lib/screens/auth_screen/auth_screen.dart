import 'package:done_premium/constants/app_common_style.dart';
import 'package:done_premium/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../componants/custom_btn.dart';
import '../../componants/dialog.dart';
import '../../componants/phone_number_field.dart';
import '../../constants/app_color.dart';
import 'controller/signup_controller.dart';
class AuthScreen extends StatelessWidget {
      AuthScreen({Key? key}) : super(key: key);

  final  controller = Get.put(SignUpController());

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Center(
          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Common.sizedBoxH,
                      SvgPicture.asset(
                        "assets/images/login.svg",
                        width: 200.w,
                        height: 400.h,
                        fit: BoxFit.cover,
                      ),
                      Common.sizedBoxH,

                      PhoneNumberField(
                        controller: controller.phoneTextEditingController,
                        onChange: (PhoneNumber number)async{
                          controller.fullPhoneNumber = number.phoneNumber;
                         }, ),
                      Common.sizedBoxH,

                      Directionality(
                          textDirection:  TextDirection.rtl,
                          child: CutomTextField(
                            controller: TextEditingController(),
                            hint: "user_name".tr,
                            onChanged: (newValue) async{
                              controller.userNameTextEditingController =
                                  newValue;
                            },
                            validator:  (value) {
                              if (value == null || value.isEmpty) {
                                return 'please_enter_your_user_name'.tr;
                              }
                              return null;
                            }, rounded: false,
                          ),
                        ),
                      Common.sizedBoxH,
                      Button(
                        text: "register_user".tr,
                        onPressed: () async {
                          Get.to(Home());
                          // showDialog1(context);
                          //  await controller.sendVerificationCode(phone:controller.fullPhoneNumber
                          //     ,name:controller.userNameTextEditingController );
                        }, isFramed: false,
                        height:80.h,
                        fontSize: 22.sp,
                        size: 250
                      ),
                    ],
                  ),
        ),
     )

    );
  }
}

class CutomTextField extends StatelessWidget {
    CutomTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.hint,
    required this.validator,
    required this.rounded,
  }) : super(key: key);

  final TextEditingController controller;
  void Function(String)?  onChanged;
    String? Function(String?)?  validator;
  final String hint;
  final bool rounded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 348.w,
      // height: 60.w,
      child:  TextFormField(
        controller: controller,
        style: TextStyle(color: kPrimaryColor,fontSize: 18.sp,fontWeight: FontWeight.bold ),
        keyboardType: TextInputType.name,
        validator:validator,
        onChanged: onChanged,
        cursorColor: greyColor,
        decoration:  InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: EdgeInsets.all(10.w),
          hintStyle: TextStyle(color: mainColor, fontSize: 16.sp),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.green,
            ),
            borderRadius: BorderRadius.circular(50.r),
          ),
          focusedBorder:rounded?Common.focusedBorderRounded :Common.focusedBorder,
          enabledBorder:rounded?Common.focusedBorderRounded :Common.focusedBorder,
          // enabledBorder:Common.focusedBorder,
          disabledBorder:Common.focusedBorder,
        ),
      ),
    );
  }
}
