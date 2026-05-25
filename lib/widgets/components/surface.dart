import 'package:flutter/material.dart';
import 'package:hello_world/widgets/app_theme.dart';

class Surface extends StatelessWidget {
  const Surface({
    super.key,
    required this.child  
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        color: theme.surfaceColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: theme.surfaceBorderColor),
      ),
      child: child,
    );
  }
}