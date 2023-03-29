import 'package:excel/excel.dart';
import 'dart:io';
import 'package:flutter/services.dart' show ByteData, rootBundle;

// void readExcelFile(String fileName) async {

//   ByteData data = await rootBundle.load("assets/$fileName");
//   var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//   var excel = Excel.decodeBytes(bytes);
//   for (var table in excel.tables.keys) {
//       print(table); //sheet Name
//       print(excel.tables[table]!.maxCols);
//       print(excel.tables[table]!.maxRows);
//       for (var row in excel.tables[table]!.rows) {
//         print("$row");
//       }
//     }
// }


Future<void> readExcelFile() async {
  // Load the Excel file
  final bytes = File("assets/test.txt").readAsStringSync();

  // final bytes = await rootBundle.load('assets/test.txt');
  // final buffer = bytes.buffer;
  // print('Read ${buffer.lengthInBytes} bytes from file');



  // final excel = Excel.decodeBytes(bytes);
  // if (bytes == null) {
  //   print('Error: Failed to read file');
  //   return;
  // }

  // // Get the first sheet in the Excel file
  // final sheet = excel.tables.values.first;

  // // Read the data from a cell
  // final cellValue = sheet.cell(CellIndex.indexByString("B1")).value;

  // print('Cell B1 value: $cellValue');
}

