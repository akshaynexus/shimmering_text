import 'package:flutter/widgets.dart';

import 'shimmer.dart';

/// A [Text] widget with an animated shimmer sweeping across it.
///
/// This is a thin convenience wrapper around [Shimmer] that renders [data] as
/// text. The text is painted white internally so the shimmer shader is the only
/// thing that controls its visible color; use [baseColor] and [highlightColor]
/// to tune the effect.
///
/// ```dart
/// ShimmeringText(
///   'Thinking…',
///   baseColor: Colors.grey,
///   highlightColor: Colors.white,
///   style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
/// )
/// ```
class ShimmeringText extends StatelessWidget {
  const ShimmeringText(
    this.data, {
    super.key,
    this.style,
    this.baseColor = const Color(0xFF475569),
    this.highlightColor = const Color(0xFFFFFFFF),
    this.duration = const Duration(milliseconds: 1450),
    this.stops = const [0.25, 0.5, 0.75],
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.textDirection,
    this.enabled = true,
  });

  /// The text to display.
  final String data;

  /// Text style. The color is overridden internally and has no effect; use
  /// [baseColor] / [highlightColor] to color the shimmer instead.
  final TextStyle? style;

  /// The dimmed color used for the start and end of the gradient.
  final Color baseColor;

  /// The bright color that sweeps across the text.
  final Color highlightColor;

  /// Duration of a single shimmer sweep before it repeats.
  final Duration duration;

  /// Gradient stops for `[baseColor, highlightColor, baseColor]`.
  final List<double> stops;

  /// Maximum number of lines before the text is truncated by [overflow].
  final int? maxLines;

  /// How visual overflow is handled.
  final TextOverflow overflow;

  /// How the text is aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// When `false` the text is rendered with [baseColor] and no animation.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = (style ?? const TextStyle());

    return Shimmer(
      baseColor: baseColor,
      highlightColor: highlightColor,
      duration: duration,
      stops: stops,
      enabled: enabled,
      child: Text(
        data,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        textDirection: textDirection,
        // Painted white so the shimmer shader fully controls the visible color.
        // When disabled, fall back to baseColor since no shader is applied.
        style: effectiveStyle.copyWith(
          color: enabled ? const Color(0xFFFFFFFF) : baseColor,
        ),
      ),
    );
  }
}
