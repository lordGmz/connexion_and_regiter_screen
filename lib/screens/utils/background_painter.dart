import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/animation.dart';

class BackgroundPainter extends CustomPainter {
  //Constructor with different paint pattern
  BackgroundPainter({Animation<double> animation})
      : greenPaint = Paint()
          ..color = Colors.green
          ..style = PaintingStyle.fill,
        greenAccentPaint = Paint()
          ..color = Colors.teal
          ..style = PaintingStyle.fill,

        liquidAnimation = CurvedAnimation(
          curve: Curves.elasticOut,
          reverseCurve: Curves.easeInBack,
          parent: animation,
        ),
        greenAccentAnimation = CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            0.8,
            curve: Interval(0, 0.9, curve: SpringCurve()),
          ),
          reverseCurve: Curves.easeInCirc,
        ),
        greenAnimation = CurvedAnimation(
          parent: animation,
          curve: const SpringCurve(),
          reverseCurve: Curves.easeInCirc,
        ),
        super(repaint: animation);

  final Animation<double> liquidAnimation;
  final Animation<double> greenAnimation;
  final Animation<double> greenAccentAnimation;

  final Paint greenPaint;
  final Paint greenAccentPaint;

  @override
  void paint(Canvas canvas, Size size) {
    print('Paint');
    paintGreen(canvas, size);
    paintGreenAccent(canvas, size);
  }
  void paintGreenAccent(Canvas canvas, Size size ) {
    final path = Path();
    path.moveTo(size.width, 100);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(
        size.height / 4,
        size.height / 2,
        greenAccentAnimation.value,
      ),
    );
    _addPointsToPath(
      path,
      [
        Point(
          size.width / 4,
          lerpDouble(size.height / 2, size.height * 2 / 4, liquidAnimation.value),
        ),
        Point(
          size.width * 3 / 5,
          lerpDouble(size.height *2 / 4, size.height*2 / 3, liquidAnimation.value),
        ),
        Point(
          size.width * 4 / 5,
          lerpDouble(size.height / 6, size.height / 4, greenAccentAnimation.value),
        ),
        Point(
          size.width,
          lerpDouble(size.height / 5, size.height / 2, greenAccentAnimation.value),
        ),
      ],
    );

    canvas.drawPath(path, greenAccentPaint);
  }

  void paintGreen(Canvas canvas, Size size) {
    //the path the paint need to follow
    final path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(0, size.height, greenAnimation.value),
    );
    _addPointsToPath(path, [
      Point(
        lerpDouble(0, size.width / 3, greenAnimation.value),
        lerpDouble(0, size.height, greenAnimation.value),
      ),
      Point(
        lerpDouble(size.width / 2, size.width / 4 * 3, liquidAnimation.value),
        lerpDouble(size.height / 2, size.height / 4 * 3, liquidAnimation.value),
      ),
      Point(
        size.width,
        lerpDouble(size.height / 2, size.height * 4 / 5, liquidAnimation.value),
      ),
    ]);
    canvas.drawPath(path, greenPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _addPointsToPath(Path path, List<Point> points) {
    if (points.length < 3) {
      throw UnsupportedError('Need three or more points to create a path.');
    }

    for (var i = 0; i < points.length - 2; i++) {
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    // connect the last two points
    path.quadraticBezierTo(
        points[points.length - 2].x,
        points[points.length - 2].y,
        points[points.length - 1].x,
        points[points.length - 1].y);
  }
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

// Custom curve to give gooey spring effect
class SpringCurve extends Curve {
  const SpringCurve({
    this.a = 0.15,
    this.w = 19.4,
  });
  final double a;
  final double w;

  @override
  double transformInternal(double t) {
    return (-(pow(e, -t / a) * cos(t * w)) + 1).toDouble();
  }
}
