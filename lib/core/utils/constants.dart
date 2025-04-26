import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class AppConstants {
  //strings
  static const welcomeTitle = 'Welcome to Smart Parking';
  static const welcomeMessage = 'Your solution to parking hassles.';
  static const getStartedButton = 'Get Started';

  // Routes
  static const welcome = '/welcome';
  static const login = '/login';
  static const home = '/home';

  // Colors
  static const primaryColor = Color(0xFF6200EE);
  static const secondaryColor = Color(0xFF03DAC6);
  static const backgroundColor = Color(0xFFF5F5F5);
  static const darkPrimary = Color(0xFF3700B3);
  static const darkSecondary = Color(0xFF03DAC6);
  static const lightPrimary = Color(0xFFBB86FC);
  static const lightSecondary = Color(0xFF03DAC6);
  static const darkBackground = Color(0xFF121212);
  static const lightBackground = Color(0xFFFFFFFF);
  static const lightBackgroundColor = Color(0xFFFAFAFA);
  static const darkBackgroundColor = Color(0xFF121212);

  // Padding
  double padding = double.infinity;
  static double margin = double.infinity;
  static double paddingValue = 16.0;
  static double borderRadius = 8.0;
  static double borderWidth = 1.0;
  static double iconSize = 24.0;
  static double fontSize = 16.0;
  static double buttonHeight = 48.0;
  static double buttonWidth = 160.0;
  static double buttonBorderRadius = 12.0;
  static double buttonFontSize = 18.0;
  static double textFieldHeight = 56.0;
  static double textFieldBorderRadius = 8.0;
  static double textFieldFontSize = 16.0;
  static double textFieldPadding = 16.0;
  static double textFieldBorderWidth = 1.0;
  static double textFieldIconSize = 24.0;
  static double textFieldIconPadding = 16.0;
  // static double textFieldIconSize = 24.0;
  // static double textFieldIconPadding = 16.0;
  // static double textFieldIconSize = 24.0;
  // static double textFieldIconPadding = 16.0;
  // static double textFieldIconSize = 24.0;
  // static double textFieldIconPadding = 16.0;
  // static double textFieldIconSize = 24.0;
  // static double textFieldIconPadding = 16.0;
  // static double textFieldIconSize = 24.0;
  // static double textFieldIconPadding = 16.0;

  // Theme settings
  static String themeSettings = 'themeSettings';
  static String isDarkMode = 'isDarkMode';
  static String isLightMode = 'isLightMode';
  static String isSystemMode = 'isSystemMode';
  static String isDarkModeEnabled = 'isDarkModeEnabled';
  static String isLightModeEnabled = 'isLightModeEnabled';
  static String isSystemModeEnabled = 'isSystemModeEnabled';
  static String isDarkModeDisabled = 'isDarkModeDisabled';
  static String isLightModeDisabled = 'isLightModeDisabled';
  static String isSystemModeDisabled = 'isSystemModeDisabled';
  static String isDarkModeEnabledKey = 'isDarkModeEnabledKey';
  static String isLightModeEnabledKey = 'isLightModeEnabledKey';
  static String isSystemModeEnabledKey = 'isSystemModeEnabledKey';
  static String isDarkModeDisabledKey = 'isDarkModeDisabledKey';
  static String isLightModeDisabledKey = 'isLightModeDisabledKey';
  static String isSystemModeDisabledKey = 'isSystemModeDisabledKey';
  static String isDarkModeEnabledValue = 'isDarkModeEnabledValue';
  static String isLightModeEnabledValue = 'isLightModeEnabledValue';
  static String isSystemModeEnabledValue = 'isSystemModeEnabledValue';
  static String isDarkModeDisabledValue = 'isDarkModeDisabledValue';
  static String isLightModeDisabledValue = 'isLightModeDisabledValue';
  static String isSystemModeDisabledValue = 'isSystemModeDisabledValue';
  static String isDarkModeEnabledValueKey = 'isDarkModeEnabledValueKey';
  static String isLightModeEnabledValueKey = 'isLightModeEnabledValueKey';
  static String isSystemModeEnabledValueKey = 'isSystemModeEnabledValueKey';
  static String isDarkModeDisabledValueKey = 'isDarkModeDisabledValueKey';
  static String isLightModeDisabledValueKey = 'isLightModeDisabledValueKey';
  static String isSystemModeDisabledValueKey = 'isSystemModeDisabledValueKey';

  static var spacingMedium = const SizedBox(height: 16.0);
  static var spacingLarge = const SizedBox(height: 32.0);
  static var spacingSmall = const SizedBox(height: 8.0);
  static var spacingXSmall = const SizedBox(height: 4.0);
  static var spacingXXSmall = const SizedBox(height: 2.0);
  static var spacingXXXLarge = const SizedBox(height: 64.0);
  static var spacingXXLarge = const SizedBox(height: 48.0);
  // static var spacingXXXLarge = const SizedBox(
  //   height: 64.0,
  // );
  static var spacingXXXXLarge = const SizedBox(height: 80.0);
  static var spacingXXXXXLarge = const SizedBox(height: 96.0);
  static var spacingXXXXXXLarge = const SizedBox(height: 112.0);
  static var spacingXXXXXXXLarge = const SizedBox(height: 128.0);
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 144.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 160.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 176.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 192.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 208.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 224.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 240.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 256.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 272.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 288.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 304.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 320.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 336.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 352.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 368.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 384.0,
  // );
  // static var spacingXXXXXXXLarge = const SizedBox(
  //   height: 400.0,
  // );

  static String useDarkGradient = '';

  static var spacingMediumValue;

  static var iconSizeFactor;
  //   static String isDarkModeEnabledValueKey = 'isDarkModeEnabledValueKey';
  //   static String isLightModeEnabledValueKey = 'isLightModeEnabledValueKey';
  //   static String isSystemModeEnabledValueKey = 'isSystemModeEnabledValueKey';
  //   static String isDarkModeDisabledValueKey = 'isDarkModeDisabledValueKey';
  //   static String isLightModeDisabledValueKey = 'isLightModeDisabledValueKey';
  //   static String isSystemModeDisabledValueKey = 'isSystemModeDisabledValueKey';
  //   static String isDarkModeEnabledValueKey = 'isDarkModeEnabledValueKey';
  //   static String isLightModeEnabledValueKey = 'isLightModeEnabledValueKey';
  //   static String isSystemModeEnabledValueKey = 'isSystemModeEnabledValueKey';
  //   static String isDarkModeDisabledValueKey = 'isDarkModeDisabledValueKey';
  //   static String isLightModeDisabledValueKey = 'isLightModeDisabledValueKey';
  //   static String isSystemModeDisabledValueKey = 'isSystemModeDisabledValueKey';
  //   static String isDarkModeEnabledValueKey = 'isDarkModeEnabledValueKey';
  //   static String isLightModeEnabledValueKey = 'isLightModeEnabledValueKey';
  //   static String isSystemModeEnabledValueKey = 'isSystemModeEnabledValueKey';
}

class AppRoutes {
  static const welcome = '/welcome';
  static const login = '/login';
  static const home = '/home';
}
