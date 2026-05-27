import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AppPreferences extends InheritedWidget {
  const AppPreferences({
    super.key, 
    required super.child,
    required this.prefs
  });

  final SharedPreferencesAsync prefs;

  static SharedPreferencesAsync of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppPreferences>();
    assert(widget != null, 'No AppPreferences found in context.');
    return widget!.prefs;
  }

  @override
  bool updateShouldNotify(covariant AppPreferences oldWidget) => prefs != oldWidget.prefs;
}