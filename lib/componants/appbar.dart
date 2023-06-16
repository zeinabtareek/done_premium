
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_assets.dart';
import '../constants/app_color.dart';
import '../constants/app_common_style.dart';
import '../screens/search_screen/search_screen.dart';

class ArrowsAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
final String? title;
  final Widget? icon;
  final Widget? filterIcon;
  final Widget? widgetAppBar;
final bool  isFilter;
final bool  searchIcon;
final double ? height;

final bool   isSearched;
  ArrowsAppBar(
        {
        this.icon,
        this.title,
          required this.isFilter,
        this.filterIcon,
        this.height,
        required this.searchIcon,
        this.widgetAppBar,
        required this.isSearched,
        Key? key,
      })  : preferredSize = Size.fromHeight(height!.h??70),
        super(key: key);

  @override
  State<ArrowsAppBar> createState() => _ArrowsAppBarState();
}

class _ArrowsAppBarState extends State<ArrowsAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
       elevation: 1,
      centerTitle: true,
      title:widget.title!=null?
      Text(widget.title.toString(),style: Common.textRedAppBarTitle,):
      widget.isSearched?widget.widgetAppBar:
      Image.asset(logo,fit: BoxFit.contain,height: 50.h,),
      backgroundColor: whiteColor,

      actions: [
      widget.searchIcon?  IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            icon: Icon(
              Icons.search,
              color: mainColor,
              size: 30.sp,
            )):SizedBox(),
        widget.isFilter==true?
        widget.filterIcon!:widget.filterIcon!
      ],
      leading: widget.icon,
    );
  }
}
