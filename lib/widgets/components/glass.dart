import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:hello_world/widgets/app_theme.dart';

class Glass extends StatelessWidget {
  const Glass({
    super.key,
    this.border = true,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.boxShadow = const [BoxShadow(color: Color.fromRGBO(0, 0, 0, .3), blurRadius: 16, blurStyle: .outer)],
    this.backdropBlurRadius = 12,
    // this.constraints,
    required this.child
  });

  // final BoxConstraints? constraints;

  final bool border;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow> boxShadow;
  final double backdropBlurRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: boxShadow
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: backdropBlurRadius, sigmaY: backdropBlurRadius),
        child: AnimatedContainer(
          // constraints: constraints,
          decoration: BoxDecoration(
            color: theme.glassColor,
            borderRadius: borderRadius,
            border: border ? Border.all(color: theme.glassBorderColor) : null
          ),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutExpo,
          child: child,
        ),
      ),
    );
  }
}