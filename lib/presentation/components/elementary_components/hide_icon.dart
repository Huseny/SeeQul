import 'package:flutter/material.dart';

class HideIcon extends StatefulWidget {
  const HideIcon({
    super.key,
    required this.icon,
    required this.borderRadius,
  });
  final Icon icon;
  final BorderRadius borderRadius;

  @override
  State<HideIcon> createState() => _HideIconState();
}

class _HideIconState extends State<HideIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, child) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 50,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            color: const Color.fromARGB(255, 226, 30, 49)),
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  transform: _SlideGradientTransform(
                      percent: _animationController.value),
                  colors: const [Colors.white10, Colors.white, Colors.white10])
              .createShader(bounds),
          child: child,
        ),
      ),
      child: Row(
        children: [
          Align(
            widthFactor: 0.4,
            child: widget.icon,
          ),
          Align(widthFactor: 0.4, child: widget.icon),
          Align(widthFactor: 0.4, child: widget.icon),
        ],
      ),
    );
  }
}

class _SlideGradientTransform extends GradientTransform {
  final double percent;
  const _SlideGradientTransform({required this.percent});
  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * percent, 0, 0);
  }
}
