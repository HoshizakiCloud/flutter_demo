import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/widgets/scaffold/drawer/page_route.dart';
import 'package:hello_world/widgets/scaffold/drawer/pages/about.dart';
import 'package:hello_world/widgets/scaffold/drawer/pages/advanced.dart';
import 'package:hello_world/widgets/scaffold/drawer/pages/downloading.dart';
import 'package:hello_world/widgets/scaffold/drawer/pages/generics.dart';
import 'package:hello_world/widgets/scaffold/drawer/pages/home.dart';
import 'package:hello_world/widgets/scaffold/drawer/pages/interface.dart';



class SettingsDrawer extends StatefulWidget {
  const SettingsDrawer({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsDrawerState();

}

class _SettingsDrawerState extends State<SettingsDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: Navigator(
        onGenerateRoute: (settings) {
          return SettingsPageRoute(
            page: _routeBuilders[settings.name]!(context),
            settings: settings,
          );
        },
        onUnknownRoute: (settings) {
          return SettingsPageRoute(page: SettingsPageHome());
        },
      ),
    );
  }

  final Map<String, WidgetBuilder> _routeBuilders = {
    '/': (context) => SettingsPageHome(),
    '/generics': (context) => SettingsPageGenerics(),
    '/interface': (context) => SettingsPageInterface(),
    '/downloading': (context) => SettingsPageDownloading(),
    '/advanced': (context) => SettingsPageAdvanced(),
    '/about': (context) => SettingsPageAbout()
  };
}
