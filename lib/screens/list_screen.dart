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
  late List<Todo> todos;
  TodoDefault todoDefault = TodoDefault();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), (() {
      todos = todoDefault.getTodos();
      setState(() {
        isLoading = false;
      });
    }));
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
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  String title = "";
                  String description = "";
                  return AlertDialog(
                    title: const Text("할 일 추가하기"),
                    content: Container(
                      height: 200,
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (value) => title = value,
                            decoration: const InputDecoration(labelText: "제목"),
                          ),
                          TextField(
                            onChanged: (value) => description = value,
                            decoration: const InputDecoration(labelText: "설명"),
                          )
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              print("[UI] ADD");
                              todoDefault.addTodo(
                                  Todo(title: title, description: description));
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text("추가")),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("취소"))
                    ],
                  );
                });
          },
          child: const Text('+', style: TextStyle(fontSize: 25))),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].title),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: const Text("할 일"),
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text("제목 : " + todos[index].title)),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Text("설명 : " + todos[index].description),
                              )
                            ],
                          );
                        });
                  },
                  trailing: SizedBox(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              child: const Icon(Icons.edit),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      String title = todos[index].title;
                                      String description =
                                          todos[index].description;

                                      return AlertDialog(
                                        title: const Text("할 일 수정하기"),
                                        content: Container(
                                            height: 200,
                                            child: Column(
                                              children: [
                                                TextField(
                                                  onChanged: (value) {
                                                    title = value;
                                                  },
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          todos[index].title),
                                                ),
                                                TextField(
                                                  onChanged: (value) {
                                                    description = value;
                                                  },
                                                  decoration: InputDecoration(
                                                      hintText: todos[index]
                                                          .description),
                                                )
                                              ],
                                            )),
                                        actions: [
                                          TextButton(
                                            onPressed: () async {
                                              Todo newTodo = Todo(
                                                  title: title,
                                                  description: description,
                                                  id: todos[index].id);

                                              setState(() {
                                                todoDefault.updateTodo(newTodo);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("수정"),
                                          )
                                        ],
                                      );
                                    });
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              child: const Icon(Icons.delete),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return AlertDialog(
                                      title: const Text("할 일 삭제하기"),
                                      content: const Text("삭제하시겠습니까?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            setState(() {
                                              todoDefault.deleteTodo(
                                                  todos[index].id ?? 0);
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("삭제"),
                                        ),
                                        TextButton(
                                            onPressed: (() async {
                                              Navigator.of(context).pop();
                                            }),
                                            child: const Text("취소")),
                                      ],
                                    );
                                  }),
                                );
                              },
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
