import "package:flutter/material.dart";
import "package:flutter_mini_project_1/models/todo.dart";

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Todo> todos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('할 일 목록 앱'), actions: [
        InkWell(
          onTap: () {},
          child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.book), Text('뉴스')],
              )),
        )
      ]),
    );
  }
}
