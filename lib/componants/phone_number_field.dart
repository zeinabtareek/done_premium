import 'package:done_premium/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../screens/auth_screen/controller/signup_controller.dart';


class PhoneNumberField extends StatelessWidget {
  PhoneNumberField(
      {Key? key,
      required this.controller,
      required this.onChange(PhoneNumber v)})
      : super(key: key);

  final TextEditingController controller;
  dynamic Function(PhoneNumber v)? onChange;


  @override
  Widget build(BuildContext context) {
    bool isValidPhoneNumber = false;
    return Container(
      width: 348.w,
      child: GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (signUpController) => InternationalPhoneNumberInput(
          cursorColor: mainColor,
          keyboardType: TextInputType.number,

          locale: "ar,en",
          textAlignVertical: TextAlignVertical.top,

          textAlign:  TextAlign.right ,
          spaceBetweenSelectorAndTextField: 50.w,
          onInputChanged: onChange,

          onInputValidated: (bool value) {
            isValidPhoneNumber = value;
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            setSelectorButtonAsPrefixIcon: true,
            leadingPadding: 10,
            trailingSpace: false,
          ),
          ignoreBlank: true,
          textStyle: TextStyle(color: mainColor, fontSize: 18.sp),
          inputDecoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,

            hintText: "phone_number".tr,
            isDense: true,
            // Added this
            contentPadding: EdgeInsets.all(20.w),
            hintStyle: TextStyle(
                color: mainColor, fontSize: 18.sp, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: mainColor,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: mainColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: mainColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: mainColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          // autoValidateMode: AutovalidateMode.disabled,
          autoValidateMode: AutovalidateMode.always,

          selectorTextStyle: TextStyle(color: Colors.black, fontSize: 18.sp),
          hintText: "ادخل رقم ",
          textFieldController: controller,
          // formatInput: false,
          // keyboardType:
          // TextInputType.numberWithOptions(signed: false, decimal: true),
          inputBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 20,
              color: mainColor,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          onSaved: (PhoneNumber number) {
            print('On Saved: $number');
          },
          countrySelectorScrollControlled: true,
        ),
      ),
    );
  }
}
