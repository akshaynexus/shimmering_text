import 'package:flutter/widgets.dart';

/// Applies an animated shimmer sweep over any [child].
///
/// The shimmer is rendered with a [ShaderMask] using [BlendMode.srcIn], so the
/// gradient is clipped to the opaque pixels of [child]. This works best when
/// the child paints in a solid color (e.g. text or icons), because the shimmer
/// gradient replaces the child's colors entirely while it is [enabled].
///
/// ```dart
/// Shimmer(
///   baseColor: Colors.grey,
///   highlightColor: Colors.white,
///   child: Text('Loading…'),
/// )
/// ```
class Shimmer extends StatefulWidget {
  const Shimmer({
    super.key,
    required this.child,
    this.baseColor = const Color(0xFF475569),
    this.highlightColor = const Color(0xFFFFFFFF),
    this.duration = const Duration(milliseconds: 1450),
    this.stops = const [0.25, 0.5, 0.75],
    this.enabled = true,
  });

  /// The widget the shimmer is painted over.
  final Widget child;

  /// The dimmed color used for the start and end of the gradient.
  final Color baseColor;

  /// The bright color that sweeps across the [child].
  final Color highlightColor;

  /// Duration of a single shimmer sweep before it repeats.
  final Duration duration;

  /// Gradient stops for `[baseColor, highlightColor, baseColor]`.
  ///
  /// Must contain exactly three ascending values in the `0.0`–`1.0` range.
  final List<double> stops;

  /// When `false` the [child] is rendered as-is, with no shader or animation.
  final bool enabled;

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _syncAnimation();
  }

  @override
  void didUpdateWidget(Shimmer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
    if (oldWidget.enabled != widget.enabled ||
        oldWidget.duration != widget.duration) {
      _syncAnimation();
    }
  }

  void _syncAnimation() {
    if (widget.enabled) {
      _controller.repeat();
    } else {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    assert(
      widget.stops.length == 3,
      'Shimmer.stops must contain exactly three values.',
    );

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final sweep = (_controller.value * 3.0) - 1.5;
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment(sweep - 1, 0),
              end: Alignment(sweep + 1, 0),
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: widget.stops,
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
