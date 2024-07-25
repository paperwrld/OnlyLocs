// dart packages
import 'package:flutter/material.dart';

// constants
const double defaultPadding = 20;
const double defaultSpacing = 20;
const BorderRadius defaultBorderRadius = BorderRadius.all(Radius.circular(10));
const String defaultDarkImage = AppStrings.darkModeIcon;
const String defaultLightImage = AppStrings.lightModeIcon;

class AppStrings {
  static const String appTitle = 'LocalsOnly';
  static const String createSomething = 'Create Something:';
  static const String activity = 'Activity';
  static const String board = 'Board';
  static const String darkModeIcon = 'assets/images/dark_mode_face.png';
  static const String lightModeIcon = 'assets/images/light_mode_face.png';

  static const String guestText = 'Sign in as guest';

  // error messages
  static const String authFailure = 'Failure to authenticate.';
  static const String signOutFailure = 'Failure to sign out.';
  static const String unknownFailure = 'Unknown failure occured';
  static const String phoneSignInFailureMessage =
      'Failed signing in with phone.';
  static const String anonSignInFailureMessage =
      'Failed signing in anonymously.';
}