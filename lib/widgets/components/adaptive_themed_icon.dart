import 'package:flutter/material.dart';
import 'package:hello_world/widgets/app_theme.dart';

class AdaptiveThemedIcon extends StatefulWidget {
  const AdaptiveThemedIcon(this.iconData, {
    super.key,
    this.size,
    this.color,
  });
  
  final IconData iconData;
  final double? size;
  final Color? color;

  @override
  State<AdaptiveThemedIcon> createState() => _AdaptiveThemedIconState();
}

class _AdaptiveThemedIconState extends State<AdaptiveThemedIcon>with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  Color? _currentColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  Color _resolveTargetColor() =>
      widget.color ?? AppTheme.of(context).contentColor;

  void _transitionToColor(Color targetColor) {
    if (_currentColor == null) {
      _currentColor = targetColor;
      _colorAnimation = ColorTween(
        begin: targetColor,
        end: targetColor,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutExpo,
      ));
    } else if (targetColor != _currentColor) {
      final previousColor = _currentColor;
      _currentColor = targetColor;
      _colorAnimation = ColorTween(
        begin: previousColor,
        end: targetColor,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutExpo,
      ));
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _transitionToColor(_resolveTargetColor());
  }

  @override
  void didUpdateWidget(covariant AdaptiveThemedIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.color != oldWidget.color) {
      _transitionToColor(_resolveTargetColor());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Icon(
          widget.iconData,
          size: widget.size,
          color: _colorAnimation.value,
        );
      },
    );
  }
}
