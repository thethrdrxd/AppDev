import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentListPage(),
    );
  }
}

class StudentListPage extends StatefulWidget {
  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  List<String> students = [];

  void _showAddStudentDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("ARI PAG ADD SA DEMONYO ANIMAL KA"),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "PANGAN SA DEMONYO"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("ABORT MISSION"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("EBUTANG ANIMAL"),
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  setState(() {
                
                    students.add(nameController.text);
                  });
                 //
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  // 
  void _deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //
      backgroundColor: Color.fromARGB(255, 183, 189, 192), 

      appBar: AppBar(
        title: Text("LISTA SA MGA ANAK SA TAGA ISRAEL",
        style: TextStyle(
          color: Colors.green.shade100,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
        backgroundColor: Color.fromARGB(255, 44, 45, 46), 
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              color: Color.fromARGB(255, 153, 178, 152), 
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
              
                    _deleteStudent(index);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    crossAxisAlignment: CrossAxisAlignment.center,  
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "${students[index]}",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                          color:Colors.green.shade900 ),
                          textAlign: TextAlign.center, 
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddStudentDialog(context),
        tooltip: 'Add Student',
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 117, 120, 117), 
      ),
    );
  }
}
