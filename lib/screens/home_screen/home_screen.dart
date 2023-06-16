import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  RxList  subCategories=[].obs;
  final indexx;
    HomeScreen({Key? key ,required this.subCategories
      ,required this.indexx
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
          // ...List.generate(subCategories.length, (index) =>
              Text('${subCategories[indexx].name}')
          // )
          ],
        ),
      ),
    );
  }
}
