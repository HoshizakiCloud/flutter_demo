import 'package:flutter/material.dart' show Colors;
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class AppThemeData {
  final Color primaryColor;
  final bool darkMode;

  // ── 内容颜色 (文字 / 图标) ──
  late final Color contentColor;          // 高强调 (1.0)
  late final Color contentColorSecondary; // 中强调 (0.60)
  late final Color contentColorTertiary;  // 低强调 / 禁用 (0.38)

  // ── 表面颜色 ──
  late final Color backgroundColor;
  late final Color scaffoldBackgroundColor;
  late final Color surfaceColor;
  late final Color surfaceBorderColor;

  // ── 毛玻璃颜色 ──
  late final Color glassColor;
  late final Color glassBorderColor;

  // ── 文本输入颜色 ──
  late final Color cursorColor;
  late final Color backgroundCursorColor;
  late final Color selectionColor;

  AppThemeData({
    this.primaryColor = Colors.teal,
    bool? darkMode,
  }) : darkMode = darkMode ?? (SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.dark) {
    if (this.darkMode) {
      contentColor = const Color.fromRGBO(255, 255, 255, 1);
      contentColorSecondary = const Color.fromRGBO(255, 255, 255, 0.60);
      contentColorTertiary = const Color.fromRGBO(255, 255, 255, 0.38);
      backgroundColor = const Color.fromRGBO(24, 24, 24, 1);
      scaffoldBackgroundColor = const Color.fromRGBO(16, 16, 16, 1);
      surfaceColor = const Color.fromRGBO(24, 24, 24, 1);
      surfaceBorderColor = const Color.fromRGBO(255, 255, 255, 0.10);
      glassColor = const Color.fromRGBO(0, 0, 0, 0.54);
      glassBorderColor = const Color.fromRGBO(255, 255, 255, 0.12);
      cursorColor = const Color.fromRGBO(255, 255, 255, 0.87);
      backgroundCursorColor = const Color.fromRGBO(255, 255, 255, 0.54);
      selectionColor = const Color.fromRGBO(255, 255, 255, 0.26);
    } else {
      contentColor = const Color.fromRGBO(13, 13, 13, 1);
      contentColorSecondary = const Color.fromRGBO(13, 13, 13, 0.60);
      contentColorTertiary = const Color.fromRGBO(13, 13, 13, 0.38);
      backgroundColor = const Color.fromRGBO(255, 255, 255, 1);
      scaffoldBackgroundColor = const Color.fromRGBO(224, 242, 241, 1);
      surfaceColor = const Color.fromRGBO(255, 255, 255, 1);
      surfaceBorderColor = const Color.fromRGBO(0, 0, 0, 0.12);
      glassColor = const Color.fromRGBO(255, 255, 255, 0.48);
      glassBorderColor = const Color.fromRGBO(0, 0, 0, 0.10);
      cursorColor = const Color.fromRGBO(13, 13, 13, 0.87);
      backgroundCursorColor = const Color.fromRGBO(13, 13, 13, 0.54);
      selectionColor = const Color.fromRGBO(13, 13, 13, 0.26);
    }
  }
}

class AppTheme extends StatefulWidget {
  const AppTheme({
    super.key,
    required this.data,
    required this.child,
  });

  final AppThemeData data;
  final Widget child;

  static AppThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<_InheritedAppTheme>();
    assert(widget != null, 'No AppTheme found in context.');
    return widget!.data;
  }

  static void updateTheme(BuildContext context, AppThemeData data) {
    final widget = context.dependOnInheritedWidgetOfExactType<_InheritedAppTheme>();
    assert(widget != null, 'No AppTheme found in context.');
    widget!.setTheme(data);
  }

  @override
  State<StatefulWidget> createState() => _AppTheme();
}

class _AppTheme extends State<AppTheme> {
  late AppThemeData _data;

  @override
  void initState() {
    super.initState();
    _data = widget.data;
  }

  void setTheme(AppThemeData data) {
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedAppTheme(data: _data, setTheme: setTheme, child: widget.child);
  }
}

class _InheritedAppTheme extends InheritedWidget {
  const _InheritedAppTheme({
    required super.child,
    required this.data,
    required this.setTheme,
  });

  final AppThemeData data;
  final ValueChanged<AppThemeData> setTheme;

  @override
  bool updateShouldNotify(covariant _InheritedAppTheme oldWidget) => data != oldWidget.data;
}
