import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:share_study_app/firestore_api.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FirestoreApi firestoreApi = new FirestoreApi();
    Future<List<String>> subjects;
    return Scaffold(
      appBar: AppBar(
        title: Text("debug"),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text("yes"),
        onPressed: () {},
      )),
    );
  }
}
