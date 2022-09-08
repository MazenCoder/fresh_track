import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Custom Text Styles Class For Both Dark and Light Theme
class CustomTextTheme {
  //! Default Font is GoogleFonts.roboto You can change it as your Need

  static const _textColorLight = Color(0xff0f0e17); // Light Theme Default Text Color
  // static const _textColorSubTitleLight = Colors.black54;

  static const _textColorDark = Color(0xFFFFFFFF);

  static TextTheme get textThemeLight {
    return _textTheme(textColor: _textColorLight);
  }

  static TextTheme get textThemeDark {
    return _textTheme(textColor: _textColorDark);
  }

  // Private Method For Text Theme so that we can change the vale for Both Dark And Light Theme
  static TextTheme _textTheme({required Color textColor}) {
    const FontWeight lightWeight = FontWeight.w300;
    const FontWeight mediumWeight = FontWeight.w500;
    const FontWeight regularWeight = FontWeight.w400;

    return TextTheme(
      headline1: GoogleFonts.roboto(
        fontSize: 96,
        color: textColor,
        fontWeight: lightWeight,
        letterSpacing: -1.5,
      ),
      headline2: GoogleFonts.roboto(
        color: textColor,
        fontSize: 60,
        fontWeight: lightWeight,
        letterSpacing: -0.5,
      ),
      headline3: GoogleFonts.roboto(
        color: textColor,
        fontSize: 48,
        fontWeight: regularWeight,
        letterSpacing: 0.0,
      ),
      headline4: GoogleFonts.roboto(
        color: textColor,
        fontSize: 34,
        fontWeight: regularWeight,
        letterSpacing: 0.25,
      ),
      headline5: GoogleFonts.roboto(
        color: textColor,
        fontSize: 24,
        fontWeight: regularWeight,
        letterSpacing: 0.0,
      ),
      headline6: GoogleFonts.roboto(
        color: textColor,
        fontSize: 20,
        fontWeight: mediumWeight,
        letterSpacing: 0.15,
      ),
      bodyText1: GoogleFonts.roboto(
        color: textColor,
        fontSize: 16,
        fontWeight: regularWeight,
        letterSpacing: 0.5,
      ),
      bodyText2: GoogleFonts.roboto(
        color: textColor,
        fontSize: 14,
        fontWeight: regularWeight,
        letterSpacing: 0.25,
      ),
      subtitle1: GoogleFonts.roboto(
        color: textColor,
        fontSize: 15,
        fontWeight: regularWeight,
        letterSpacing: 0.5,
      ),
      subtitle2: GoogleFonts.roboto(
        color: textColor,
        fontSize: 14,
        fontWeight: regularWeight,
        letterSpacing: 0.5,
      ),
      button: GoogleFonts.roboto(
        color: textColor,
        fontSize: 14,
        fontWeight: mediumWeight,
        letterSpacing: 1.25,
      ),
      caption: GoogleFonts.roboto(
        color: textColor,
        fontSize: 12,
        fontWeight: regularWeight,
        letterSpacing: 0.4,
      ),
      overline: GoogleFonts.roboto(
        color: textColor,
        fontSize: 10,
        fontWeight: regularWeight,
        letterSpacing: 1.5,
      ),
    );
  }
}
