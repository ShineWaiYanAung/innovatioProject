import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innovation_proeject/features/appBusinessFeatures/pages/bottom_navigation.dart';

import '../features/appBusinessFeatures/pages/subpages/dash_board.dart';

/// Abstract class defining the contract for platform-specific screens.
abstract class ParentScreen {
  Widget build(BuildContext context);
}

/// Platform-specific implementation for Android screens.
class AndroidScreen implements ParentScreen {
  @override
  Widget build(BuildContext context) {
    final MobileOrTablet deviceScreen = MobileOrTabletScreenFactory.getPlatformScreen(context);
    return deviceScreen.build(context);
  }
}

/// Platform-specific implementation for iOS screens.
class IosScreen implements ParentScreen {
  @override
  Widget build(BuildContext context) {
    return Container(); // Add iOS-specific widgets here
  }
}

/// Platform-specific implementation for Windows screens.
class WindowScreen implements ParentScreen {
  @override
  Widget build(BuildContext context) {
    return Container(); // Add Windows-specific widgets here
  }
}

/// Factory for returning the appropriate screen implementation based on the platform.
class ScreenFactory {
  static ParentScreen getPlatformScreen(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidScreen();
      case TargetPlatform.iOS:
        return IosScreen();
      case TargetPlatform.windows:
        return WindowScreen();
      default:
        return AndroidScreen(); // Fallback to AndroidScreen
    }
  }
}

/// Abstract class defining the contract for mobile or tablet-specific screens.
abstract class MobileOrTablet {
  Widget build(BuildContext context);
}

/// Implementation for mobile views.
class MobileView implements MobileOrTablet {
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationScreen();//Add mobile-specific widgets here
  }
}

/// Implementation for tablet views.
class TabletView implements MobileOrTablet {
  @override
  Widget build(BuildContext context) {
    return Container(); // Add tablet-specific widgets here
  }
}

/// Factory for determining whether to use a mobile or tablet view.
class MobileOrTabletScreenFactory {
  static MobileOrTablet getPlatformScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Return TabletView if width is greater than 600; otherwise, MobileView
    if (width > 600) {
      return TabletView();
    } else {
      return MobileView();
    }
  }
}
