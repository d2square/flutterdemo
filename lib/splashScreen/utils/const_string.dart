/*Image Path*/
import 'package:flutter/material.dart';

const String logoImage = 'assets/man.jpeg';
const String logo = 'assets/logo.png';
const String fontRegular = 'assets/logo.png';

/*font path*/

const String fontMontserrat = 'Montserrat';

Widget verticalSize({double? width = 10.0, double? height = 10.0}) {
  return SizedBox(
    height: height,
  );
}
Widget horizontalSize({double? width = 10.0}) {
  return SizedBox(
    width: width,
  );
}