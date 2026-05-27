import 'package:flutter/widgets.dart';

/// A custom [PageRoute] with a slide-from-right + fade-in transition.
///
/// Usage:
/// ```dart
/// Navigator.of(context).push(
///   SettingsPageRoute(page: NextPage()),
/// );
/// ```
class SettingsPageRoute extends PageRouteBuilder {
  /// Creates a route that slides the new page in from the right.
  SettingsPageRoute({
    required Widget page,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeOutExpo,
    Curve reverseCurve = Curves.easeInExpo,
    super.settings,
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: _buildTransition(curve, reverseCurve),
    transitionDuration: duration,
  );

  static Widget Function(
    BuildContext,
    Animation<double>,
    Animation<double>,
    Widget,
  ) _buildTransition(Curve curve, Curve reverseCurve) {
    return (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(.33, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: curve, reverseCurve: reverseCurve)),
        child: FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: curve, reverseCurve: reverseCurve),
          child: _ExitFadeTransition(
            animation: secondaryAnimation,
            curve: curve,
            reverseCurve: reverseCurve,
            child: child,
          ),
        ),
      );
    };
  }
}

/// Makes the route fade out when another route is pushed on top of it.
class _ExitFadeTransition extends StatelessWidget {
  const _ExitFadeTransition({
    required this.animation,
    required this.curve,
    required this.reverseCurve,
    required this.child,
  });

  final Animation<double> animation;
  final Curve curve;
  final Curve reverseCurve;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: .zero, end: .new(-.33, 0)).animate(
        CurvedAnimation(parent: animation, curve: curve, reverseCurve: reverseCurve),
      ),
      child: FadeTransition(
        opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(parent: animation, curve: curve, reverseCurve: reverseCurve)
        ),
        child: child,
      ),
    );
  }
}
