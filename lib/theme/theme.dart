import 'dart:ui';

class BrandTheme{
   static String brandFont = "LatoBlack";

  static Color shadowColor = const Color(0xFFB7B7B7).withOpacity(.16);

  static Color keyLight = HexColor('#FFFFFF'); // White
  static Color keyDark = HexColor('#2E2E2E');


  static Color carbonGray = HexColor('#625D5D');
  static Color brandLight = HexColor('#e3bceb');
  static Color brandLight2 = HexColor('#bceaeb');
  static Color vendorBrand = const Color(0xff00AAAA);
  static Color lightYellow = HexColor('#AFD8AB');

  // discovery color
  // static Color discoveryModeColor = Color(0xff007AC2);24295E

  static Color shadowDark = HexColor('#D6D6D6');
  static Color shadowLight = HexColor('#F7F7F7');
  static Color shadwoAsh = HexColor('#708090');
  // static Color shadowColor = Color(0xFFB7B7B7).withOpacity(.16);

  static Color darkFontColor = HexColor('#2B002B');
  static Color dangerColor = HexColor('#F32013'); // Red
  static Color warningColor = HexColor('#EFB821'); // Yellow
  static Color infoColour = HexColor('#5bc0de'); //light blue
  static Color borderColor = HexColor('#a1a7b8');

  static Color brandColor = HexColor('#fc9003');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}