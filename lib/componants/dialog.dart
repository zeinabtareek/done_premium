import 'package:flutter/material.dart';

 import '../constants/app_color.dart';

showDialog1(BuildContext context)   {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
// The background color
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
// The loading indicator
                CircularProgressIndicator(
                  color:   mainColor,
                ),
                SizedBox(
                  height: 15,
                ),
// Some text
                Text('Loading...')
              ],
            ),
          ),
        );
      });
}
