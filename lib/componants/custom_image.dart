import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octo_image/octo_image.dart';

import '../constants/app_color.dart';


// class CustomImage extends StatelessWidget {
//   final String? image;
//   final double? height;
//   final double? width;
//   final BoxFit? fit;
//   final String? placeholder;
//
//   const CustomImage(
//       {super.key,
//         this.image,
//         this.height,
//         this.width,
//         this.fit = BoxFit.cover,
//         this.placeholder = "assets/images/no_image.png"});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).cardColor,
//       child: CachedNetworkImage(
//         imageUrl: image!,
//         height: height,
//         width: width,
//         fit: fit,
//         placeholder: (context, url) =>   Center(child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: CupertinoActivityIndicator(color: kPrimaryColor,),
//         ),),
//         errorWidget: (context, url, error) =>
//             Image.asset("assets/images/no_image.png", height: height, width: width, fit: fit),
//       ),
//     );
//   }
// }
class CustomImage extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? placeholder;

  const CustomImage({
    Key? key,
    this.image,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholder = "assets/images/no_image.png",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: CachedNetworkImage(
        imageUrl: image!,
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) => Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CupertinoActivityIndicator(
              color: kPrimaryColor,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          placeholder!,
          height: height,
          width: width,
          fit: fit,
        ),
      ),
    );
  }
}












// Widget customImage({required BuildContext context,required String image,void Function()? onTap}){
//   return   GestureDetector(
//       onTap: onTap,
//       child: Container(
//         clipBehavior: Clip.antiAlias,
//         height: MediaQuery.of(context).size.height/2.5,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           border: Border.all(
//               color: Colors.transparent,
//               width: 0),
//           borderRadius:
//           BorderRadius.circular(20.r),
//           // ),
//         ),
//         child:
//         OctoImage(
//            image: CachedNetworkImageProvider(image ),
//           placeholderBuilder:
//           OctoPlaceholder.blurHash(
//               'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
//               fit: BoxFit.cover),
//           errorBuilder: (context, url, error) {
//             return const BlurHash(
//                 hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj');
//           },
//           fit: BoxFit.cover,
//         ),
//       )
//   );
//
// }