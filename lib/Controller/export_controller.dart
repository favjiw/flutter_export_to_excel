import 'package:cloud_firestore/cloud_firestore.dart';

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
}
