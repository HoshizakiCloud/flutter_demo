import 'package:flutter/material.dart';
// import 'package:flutter_gpux/flutter_gpux.dart';
import 'package:hello_world/widgets/app.dart';
// import 'package:hello_world/gpu.dart';
import 'package:window_manager/window_manager.dart';

// final ValueNotifier<int> repaint = ValueNotifier<int>(0);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = WindowOptions(
    size: Size(320, 640),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const App());
  // runApp(DefaultGpu(child: GpuView(renderer: MyRenderer(repaint: repaint))));
}
