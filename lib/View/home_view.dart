import 'package:export_to_excel/Model/Student.dart';
import 'package:flutter/material.dart';

import '../Controller/export_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Student> students = [];
  bool isLoading = true;
  final ExportController exportController = ExportController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    try {
      final data = await exportController.getAllStudents();
      setState(() {
        students = data;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching students: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _exportToExcel() async {
    try {
      await exportController.exportToExcel(students);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exported successfully')),
      );
    } catch (e) {
      print("Error exporting to Excel: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to export data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Data Export'),
        actions: [
          IconButton(
            icon: Icon(Icons.document_scanner_rounded),
            onPressed: () {
              _exportToExcel();
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : students.isEmpty
              ? Center(child: Text('No students found'))
              : ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                    return ListTile(
                      title: Text(student.name),
                      subtitle: Text(student.email),
                      trailing: Text(student.phoneNumber),
                    );
                  },
                ),
    );
  }
}
