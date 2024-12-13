// import 'package:flutter/cupertino.dart';
//
// import '../../../parent_screen_controller.dart';
//
// /// Abstract class defining the contract for mobile or tablet-specific screens.
//
//
// /// Factory for determining whether to use a mobile or tablet view.
// class MobileOrTabletScreenFactory {
//   static Object getPlatformScreen(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//
//     // Return TabletView if width is greater than 600; otherwise, MobileView
//     if (width > 600) {
//       return TabletView();
//     } else {
//       return MobileView();
//     }
//   }
// }