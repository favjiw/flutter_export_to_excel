import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:external_path/external_path.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../Model/Student.dart';

class ExportController {
  Future<List<Student>> getAllStudents() async {
    try{
      final snapshot = await FirebaseFirestore.instance
          .collection('students')
          .get();
      return snapshot.docs.map((doc) => Student.fromJson(doc.data())).toList();
    }catch(e){
      print("Error fetching students: $e");
      throw e;
    }
  }
  Future<void> exportToExcel(List<Student> students) async {
    try{
      final excel = Excel.createExcel();
      final sheet = excel['Students'];

      sheet.appendRow([
        TextCellValue('ID'),
        TextCellValue('Name'),
        TextCellValue('Email'),
        TextCellValue('Phone Number')
      ]);

      for (var student in students) {
        sheet.appendRow([
          TextCellValue(student.id),
          TextCellValue(student.name),
          TextCellValue(student.email),
          TextCellValue(student.phoneNumber)
        ]);
      }

      String downloadPath;
      if(Platform.isAndroid){
        downloadPath = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOWNLOAD
        );
      } else {
        final dir = await getDownloadsDirectory();
        downloadPath = dir?.path ?? (await getApplicationDocumentsDirectory()).path;
      }

      final fileName = 'students_${DateTime.now().millisecondsSinceEpoch}.xlsx';
      final filePath = '$downloadPath/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(excel.encode()!);
      await OpenFile.open(filePath);
    }catch(e) {
      print("Error exporting to Excel: $e");
      throw e;
    }
  }
}
