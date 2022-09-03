import "package:flutter/material.dart";
import "package:flutter_mini_project_1/models/todo.dart";
import "dart:async";
import "package:flutter_mini_project_1/providers/todo_default.dart";

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Todo> todos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    print("initState");
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('할 일 목록 앱'), actions: [
        InkWell(
          onTap: () {},
          child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Icon(Icons.book), Text('뉴스')],
              )),
        )
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Text('+', style: TextStyle(fontSize: 25))),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].title),
                  onTap: () {},
                  trailing: SizedBox(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              child: const Icon(Icons.edit),
                              onTap: () {},
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              child: const Icon(Icons.delete),
                              onTap: () {},
                            ),
                          )
                        ],
                      )),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(); //플러터 기본 구분자
              },
            ),
    );
  }
}
