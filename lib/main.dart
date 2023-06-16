import 'package:done_premium/screens/auth_screen/auth_screen.dart';
import 'package:done_premium/screens/products_screen/products_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main()async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(460, 847),
        builder: (BuildContext , Widget) {
          return GetMaterialApp(
            home: ProductsScreen(),
            // home: AuthScreen(),
            // home: LoadingScreen(),
          );
        });
  }
}


