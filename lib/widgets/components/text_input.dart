import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/widgets/app_theme.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput>
    implements TextSelectionGestureDetectorBuilderDelegate {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  GlobalKey<EditableTextState> get editableTextKey => _editableTextKey;
  final GlobalKey<EditableTextState> _editableTextKey =
      GlobalKey<EditableTextState>();

  @override
  bool get forcePressEnabled => false;

  @override
  bool get selectionEnabled => true;

  late final TextSelectionGestureDetectorBuilder _gestureDetectorBuilder =
      TextSelectionGestureDetectorBuilder(delegate: this);

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final effectiveStyle = widget.textStyle.copyWith(
      color: widget.textStyle.color ?? theme.contentColor,
      fontFamily: widget.textStyle.fontFamily ?? 'Microsoft Yahei UI'
    );

    return _gestureDetectorBuilder.buildGestureDetector(
      child: EditableText(
        key: _editableTextKey,
        controller: _controller,
        focusNode: _focusNode,
        style: effectiveStyle,
        cursorColor: theme.cursorColor,
        cursorWidth: 1,
        backgroundCursorColor: theme.backgroundCursorColor,
        selectionColor: theme.selectionColor,
        enableInteractiveSelection: true,
        rendererIgnoresPointer: true,
      ),
    );
  }
}
