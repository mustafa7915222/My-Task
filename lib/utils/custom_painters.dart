
import 'package:flutter/cupertino.dart';
import 'package:test1/utils/constants.dart';

class BodyPainter extends CustomPainter {
  final bottomPadding = 480 ;
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * .70)
      ..lineTo(0, size.height - bottomPadding)
      ..lineTo(0, 0);

    Paint paint = Paint()..color = AppConstants.backgroundColor;

    canvas.drawPath(path, paint);
    // bottom line

    paint
      ..color = AppConstants.primaryColor
      ..strokeWidth = 5;
    canvas.drawLine(Offset(-0, size.height - bottomPadding),
        Offset(size.width + 5, size.height * .70), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}