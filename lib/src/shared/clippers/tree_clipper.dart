import 'package:flutter/cupertino.dart';

class TreeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.addPolygon(
      [
        new Offset(12.0, size.height),
        new Offset(12.0 + 35.0, size.height),
        new Offset(12.0 + 35.0 / 2, size.height - 70),
      ],
      true,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
