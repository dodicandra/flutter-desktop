import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

Future<List<List<dynamic>>> loadCsvFile(String localFile) async {
  try {
    // Get the file path
    String filePath = localFile;

    // Read the CSV file
    String csvData = await File(filePath).readAsString();

    // Convert CSV data to a List of Lists
    var csvTable = CsvToListConverter().convert(csvData);

    return csvTable;
  } catch (e) {
    throw e;
  }
}

Future<void> readCsvData(String localUri) async {
  try {
    String csvData = await rootBundle.loadString('assets/data.csv');
    List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);

    // Access data from csvTable
    for (var row in csvTable) {
      String col1 =
          row[0].toString(); // Assuming the first column is of type String
      int col2 = int.parse(
          row[1].toString()); // Assuming the second column is of type int
      // Process the data as needed...
      print(col1);
      print(col2);
    }
  } catch (e) {
    print('Error reading CSV file: $e');
  }
}
