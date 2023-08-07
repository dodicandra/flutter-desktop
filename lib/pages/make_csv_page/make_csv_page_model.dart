import 'package:flutter/widgets.dart';
import 'package:wings/flutter_flow/flutter_flow_model.dart';

class MakeCsvPageModel extends FlutterFlowModel {
  final unfocusNode = FocusNode();
  List<List<String>> data = [
    ["No.", "Name", "Point"]
  ];

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  @override
  void initState(BuildContext context) {
    // TODO: implement initState
  }
}
