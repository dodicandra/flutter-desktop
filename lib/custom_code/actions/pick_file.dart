// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

// Imports other custom actions

import 'package:file_picker/file_picker.dart';

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
