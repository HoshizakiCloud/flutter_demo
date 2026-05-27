import 'package:flutter/material.dart';
import 'package:hello_world/widgets/app_theme.dart';

class Surface extends StatefulWidget {
  const Surface({
    super.key,
    required this.child,
    this.clickable
  });

  final Widget child;
  final bool? clickable;

  @override
  State<StatefulWidget> createState() => _SurfaceState();
}

class _SurfaceState extends State<Surface> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return MouseRegion(
      onEnter: (event) => setState(() { isHover = true; }),
      onExit: (event) => setState(() { isHover = false; }),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutExpo,
        decoration: BoxDecoration(
          color: isHover ? theme.surfaceColorEmphasis : theme.surfaceColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: theme.surfaceBorderColor),
        ),
        child: widget.child,
      ),
    );
  }
}