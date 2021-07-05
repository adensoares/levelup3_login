import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _drawSunRays(canvas);
    _drawSun(canvas);

    _drawStar(canvas, 30.0, 35.0, 2.0, 0.35);
    _drawStar(canvas, 25.0, 150.0, 2.5, 0.6);
    _drawStar(canvas, 180.0, 75.0, 2.5, 0.9);
    _drawStar(canvas, 265.0, 80.0, 1.5, 0.4);
    _drawStar(canvas, 165.0, 150.0, 2.5, 0.75);
    _drawStar(canvas, 270.0, 155.0, 2.0, 0.35);
    _drawStar(canvas, 70.0, 215.0, 2.0, 0.35);
    _drawStar(canvas, 210.0, 233.0, 2.0, 0.35);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// Estrelas
_drawStar(Canvas canvas, double dx, double dy, double radius, double opacity) {
  var starGradientRadius = radius * 1.8;
  var startCenter = new Offset(dx, dy);

  var circleGradientShader = new RadialGradient(colors: [
    Colors.white.withOpacity(opacity),
    Colors.white.withOpacity(0.0)
  ]).createShader(
    new Rect.fromCircle(center: startCenter, radius: starGradientRadius),
  );

  canvas.drawCircle(startCenter, starGradientRadius,
      new Paint()..shader = circleGradientShader);
  canvas.drawCircle(
    startCenter,
    radius,
    new Paint()..color = Colors.white.withOpacity(opacity),
  );
}

// Sol
_drawSun(Canvas canvas) {
  var sunCenter = new Offset(60.0, 90.0);

  var sunInnerGradientRadius = 35.0;
  var circleInnerGradientShader = new RadialGradient(colors: [
    Colors.white.withOpacity(0.5),
    Colors.white.withOpacity(0.0)
  ]).createShader(
    new Rect.fromCircle(center: sunCenter, radius: sunInnerGradientRadius),
  );
  canvas.drawCircle(sunCenter, sunInnerGradientRadius,
      new Paint()..shader = circleInnerGradientShader);

  var sunOuternGradientRadius = 50.0;
  var circleOuternGradientShader = new RadialGradient(colors: [
    Colors.white.withOpacity(0.35),
    Colors.white.withOpacity(0.0)
  ]).createShader(
    new Rect.fromCircle(center: sunCenter, radius: sunOuternGradientRadius),
  );
  canvas.drawCircle(sunCenter, sunOuternGradientRadius,
      new Paint()..shader = circleOuternGradientShader);

  canvas.drawCircle(sunCenter, 18.0, new Paint()..color = Colors.white);
}

_drawSunRays(Canvas canvas) {
  var sunCenter = new Offset(60.0, 90.0);

  var sunRayColors = [
    Colors.white.withOpacity(0.0),
    Colors.white.withOpacity(0.5),
    Colors.white.withOpacity(0.0)
  ];

  var sunRayHorizontalRect = new Rect.fromLTRB(sunCenter.dx - 60.0,
      sunCenter.dy - 18.0, sunCenter.dx + 60.0, sunCenter.dy + 18.0);
  var sunRayVerticalRect = new Rect.fromLTRB(sunCenter.dx - 18.0,
      sunCenter.dy - 60.0, sunCenter.dx + 18.0, sunCenter.dy + 60.0);
  var sunRayHorizontalGradient = new LinearGradient(colors: sunRayColors);
  var sunRayVerticalGradient = new LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: sunRayColors,
  );

  canvas.drawRect(
    sunRayHorizontalRect,
    new Paint()
      ..shader = sunRayHorizontalGradient.createShader(sunRayHorizontalRect),
  );
  canvas.drawRect(
    sunRayVerticalRect,
    new Paint()
      ..shader = sunRayVerticalGradient.createShader(sunRayVerticalRect),
  );
}
