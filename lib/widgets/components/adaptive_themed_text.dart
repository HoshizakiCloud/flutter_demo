import 'package:flutter/material.dart';
import 'package:hello_world/widgets/app_theme.dart';

class AdaptiveThemedText extends StatelessWidget {
  const AdaptiveThemedText(this.data, {
    super.key,
    this.style
  });
  
  final String data;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final effectiveStyle = (style ?? const TextStyle()).copyWith(
      color: style?.color ?? theme.contentColor,
    );
    return AnimatedDefaultTextStyle(
      style: effectiveStyle,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      child: Text(data)
    );
  }
}
