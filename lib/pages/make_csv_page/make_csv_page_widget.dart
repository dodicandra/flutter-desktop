import 'dart:io';
import 'dart:math';

import 'package:csv/csv.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wings/flutter_flow/flutter_flow_model.dart';
import 'package:wings/flutter_flow/flutter_flow_theme.dart';
import 'package:wings/flutter_flow/flutter_flow_widgets.dart';
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
    _state = createModel(context, () => MakeCsvPageModel());
    _keyPressed = "";
  }

  int generateRandomNumber() {
    Random random = Random();
    int min = 1;
    int max = 100;
    int randomNumber = min + random.nextInt(max - min + 1);
    return randomNumber;
  }

  onSaveFile() async {
    String csv = const ListToCsvConverter().convert(_state.data);

    if (Platform.isAndroid) {
      await File("/storage/emulated/0/Download/winner-${generateRandomNumber().toString()}.csv").writeAsString(csv);
    } else {
      var dir = await getDownloadsDirectory();
      var path = dir?.path ?? "";
      await File("$path/winner-${generateRandomNumber().toString()}.csv").writeAsString(csv);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

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
              child: Text("_keyPressed: $_keyPressed"),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () {
                  var faker = Faker();

                  setState(() {
                    _state.data
                        .add([(_state.data.length).toString(), faker.person.name(), generateRandomNumber().toString()]);
                  });
                },
                text: 'Add Item',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: onSaveFile,
                text: 'Export Data',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Container(
              width: screenSize.width,
              height: screenSize.height / 2.5,
              child: SingleChildScrollView(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: _state.data[0].map((title) => DataColumn(label: Text(title))).toList(),
                        rows: _state.data
                            .sublist(1, _state.data.length)
                            .map((row) => DataRow(cells: row.map((rowItem) => DataCell(Text(rowItem))).toList()))
                            .toList(),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
