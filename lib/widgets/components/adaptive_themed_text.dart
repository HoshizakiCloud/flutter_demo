import 'package:flutter/material.dart';
import 'package:hello_world/widgets/app_theme.dart';

enum TextContrast { primary, secondary, teritary }

class AdaptiveThemedText extends StatelessWidget {
  const AdaptiveThemedText(this.data, {
    super.key,
    this.contrast = .primary,
    this.style
  });
  
  final TextContrast contrast;
  final String data;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final effectiveStyle = (style ?? const TextStyle()).copyWith(
      color: style?.color ?? switch (contrast) {
        TextContrast.primary => theme.contentColor,
        TextContrast.secondary => theme.contentColorSecondary,
        TextContrast.teritary => theme.contentColorTertiary,
      },
      fontFamily: style?.fontFamily ?? 'Microsoft Yahei UI'
    );
    return AnimatedDefaultTextStyle(
      style: effectiveStyle,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutExpo,
      child: Text(data)
    );
  }
}
