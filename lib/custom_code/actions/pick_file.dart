// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'package:file_picker/file_picker.dart';
import 'dart:io';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<String> pickFile() async {
  var path = await getPdf();
  return path;
}

Future<String> getPdf() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    File file = File(result.files.single.path!);
    return Future.value(file.path);
  } else {
    // User canceled the picker
    return Future.value("");
  }
}
