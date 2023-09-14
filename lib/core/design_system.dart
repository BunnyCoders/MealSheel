import 'package:flutter/material.dart';

class DSColors {
  // primary colors
  static const Color primary = Color.fromRGBO(252, 96, 17, 1);
  static const Color secondary = Color.fromRGBO(255, 255, 255, 1);
  static const Color primaryFontColor = Color.fromRGBO(74, 75, 77, 1);
  static const Color secondaryFontColor = Color.fromRGBO(124, 125, 126, 1);
  static const Color placeHolderColor = Color.fromRGBO(182, 187, 187, 1);

  // default system colors
  static const Color error = Color(0xffff0000);
  static const Color alert = Color(0xfffaff00);
  static const Color success = Color(0xff25B900);

  // typography colors
  static const Color headingLight = Color.fromRGBO(124, 125, 126, 1);
  static const Color headingDark = Color.fromRGBO(74, 75, 77, 1);
  static const Color bodyLight = Color.fromRGBO(255, 255, 255, 1);
  static const Color bodyDark = Color.fromRGBO(0, 0, 0, 0);
  static const Color placeHolderLight = Color.fromRGBO(182, 187, 187, 1);
  static const Color placeHolderDark = Color(0xffb3b3b3);
  static const Color linkLight = Color(0xfff4f4f4);
  static const Color linkDark = Color(0xff000000);
  static const Color iconDark = Color(0xff6B6464);

  // element backgrounds
  static const Color backgroundBodyLight = Color(0xfff9f9f9);
  static const Color backgroundBodyDark = Color(0xffF4F4F4);
  static const Color backgroundBodyGrey = Color(0xffEFEDED);
  static const Color backgroundInputField = Color(0xfffbfbfb);
  static const LinearGradient backgroundBodyGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xffEFEFEF),
      Color(0xffE2E2E2),
    ],
    tileMode: TileMode.repeated,
  );

  // border colors
  static const Color borderLight = Color(0xffe7e7e7);
  static const Color borderDark = Color(0xffc4c4c4);
}

class DSType {
  // static const String _roboto = 'Roboto';
  static const String _metropolis = 'Metropolis';

  static TextStyle h1({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontWeight: FontWeight.w300,
      fontSize: 96,
      height: 1,
      letterSpacing: -1.5,
    );
  }

  static TextStyle h2({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 60,
      fontWeight: FontWeight.w300,
      height: 1,
      letterSpacing: -0.5,
    );
  }

  static TextStyle h3({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 48,
      fontWeight: FontWeight.w300,
      height: 1,
      letterSpacing: 0,
    );
  }

  static TextStyle h4({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontWeight: FontWeight.w400,
      fontSize: 34,
      height: 1.3,
      letterSpacing: 0.25,
    );
  }

  static TextStyle h5({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 1.3,
      letterSpacing: 0,
    );
  }

  static TextStyle h6({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1.3,
      letterSpacing: 0.15,
    );
  }

  static TextStyle subtitle1({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.5,
      letterSpacing: 0.15,
    );
  }

  static TextStyle subtitle2({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.5,
      letterSpacing: 0.1,
    );
  }

  static TextStyle body1({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 16,
      fontWeight: FontWeight.w300,
      height: 1.7,
      letterSpacing: 0.5,
    );
  }

  static TextStyle body2({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      height: 1.7,
      letterSpacing: 0.25,
    );
  }

  static TextStyle button({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 1.25,
    );
  }

  static TextStyle navigation({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.7,
      letterSpacing: 0.25,
    );
  }

  static TextStyle buttonSmall({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      height: 1,
      letterSpacing: 1.25,
    );
  }

  static TextStyle caption({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.7,
      letterSpacing: 0.4,
    );
  }

  static TextStyle time({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 1.7,
      letterSpacing: 1.5,
    );
  }

  static TextStyle small({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 10,
      fontWeight: FontWeight.w300,
      height: 1.5,
      letterSpacing: 0.4,
    );
  }

  static TextStyle smallBold({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.5,
      letterSpacing: 0.25,
    );
  }

  static TextStyle largeBold({Color textColor = DSColors.primary}) {
    return TextStyle(
      color: textColor,
      // fontFamily: _roboto,
      fontFamily: _metropolis,
      fontSize: 28,
      fontWeight: FontWeight.bold,
      height: 1.3,
      letterSpacing: 0.15,
    );
  }
}

class DSSizes {
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 32;
  static const double xl = 64;
  static const double xxl = 128;
  static const double xxxl = 256;
}

class DSShadows {
  static const buttonCard = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6,
      offset: Offset(0, 2),
    )
  ];

  static const buttonCardHover = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 4,
      offset: Offset(0, 4),
    )
  ];

  static const navigationMenu = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 19,
      offset: Offset(0, 19),
    ),
    BoxShadow(
      color: Colors.black26,
      blurRadius: 6,
      offset: Offset(0, 8),
    )
  ];

  static const modal = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 8,
      offset: Offset(7, 14),
    )
  ];

  static const bottomSheet = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 8,
      offset: Offset(-2, 4),
    )
  ];
}
