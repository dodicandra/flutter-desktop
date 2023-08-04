import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wings/pages/make_csv_page/make_csv_page_model.dart';

class MakeCsvPage extends StatefulWidget {
  const MakeCsvPage({super.key});

  @override
  State<MakeCsvPage> createState() => _MakeCsvPageState();
}

class _MakeCsvPageState extends State<MakeCsvPage> {
  late MakeCsvPageModel _state;
  String _keyPressed = "";

  @override
  void initState() {
    super.initState();
    _keyPressed = "";
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (event) {
        if (event is RawKeyDownEvent) {
          _keyPressed = "Key Down: ${event.logicalKey.keyLabel}";
        } else if (event is RawKeyUpEvent) {
          _keyPressed = "Key Up: ${event.logicalKey.keyLabel}";
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(child: Text("make csv")),
          actions: [],
        ),
        body: Column(
          children: [
            Center(
              child: Text("oke"),
            ),
            Center(
              child: Text("_keyPressed: ${_keyPressed}"),
            )
          ],
        ),
      ),
    );
  }
}
