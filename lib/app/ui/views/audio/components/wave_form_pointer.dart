
import 'dart:math';

import 'package:flutter/material.dart';

class WaveformPainter extends CustomPainter {
  final List<double> barHeights;
  final List<Color> barColors;
  final double maxHeight;
  final double barWidth;
  final double barSpacing;
  final double barRadius;
  final double amplitude;
  final double animationValue;
  final bool isRecording;

  WaveformPainter({
    required this.barHeights,
    required this.barColors,
    required this.maxHeight,
    required this.barWidth,
    required this.barSpacing,
    required this.barRadius,
    required this.amplitude,
    required this.animationValue,
    required this.isRecording,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final int barCount = barHeights.length;
    final double totalWidth = barCount * barWidth + (barCount - 1) * barSpacing;
    final double startX = (size.width - totalWidth) / 2;

    for (int i = 0; i < barCount; i++) {
      double h = barHeights[i];

      if (isRecording) {
        final phase = animationValue * 2 * pi + (i * 0.4);
        h = h + sin(phase) * amplitude;
        h = h.clamp(4.0, maxHeight);
      }

      final paint = Paint()
        ..color = barColors[i]
        ..style = PaintingStyle.fill;

      final x = startX + i * (barWidth + barSpacing);
      final y = size.height - h;

      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, barWidth, h),
        Radius.circular(barRadius),
      );
      canvas.drawRRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant WaveformPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.isRecording != isRecording;
  }
}
