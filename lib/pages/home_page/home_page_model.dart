import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<List<dynamic>> csvData = [];
  String pdfPath = 'hello word';

  String text = 'Text Staet';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - pickFile] action in Button widget.
  String? path;
  // Stores action output result for [Custom Action - convertToBoolean] action in Button widget.
  bool? oke;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future<String?> setpdf(BuildContext context) async {
    String? path;

    path = await actions.pickFile();
    pdfPath = 'path';

    return null;
  }

  /// Additional helper methods are added here.
}
