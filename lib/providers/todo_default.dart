import "package:flutter_mini_project_1/models/todo.dart";

class TodoDefault {
  List<Todo> dummyTodos = [
    Todo(id: 1, title: "플러터 공부", description: "책 읽기"),
    Todo(id: 2, title: "서점 가기", description: "책 사기"),
    Todo(id: 3, title: "공원에서 운동하기", description: "집 근처에서 운동하기"),
    Todo(id: 4, title: "잠자기", description: "일찍 자기")
  ];

  List<Todo> getTodos() {
    return dummyTodos;
  }

  Todo getTodo(int index) {
    return dummyTodos[index];
  }

  Todo addTodo(Todo todo) {
    Todo newTodo = Todo(
        id: dummyTodos.length + 1,
        title: todo.title,
        description: todo.description);

    dummyTodos.add(newTodo);
    return newTodo;
  }

  void deleteTodo(int id) {
    for (int i = 0; i < dummyTodos.length; i++) {
      if (dummyTodos[i].id == id) {
        dummyTodos.removeAt(i);
      }
    }
  }

  void updateTodo(Todo todo) {
    for (int i = 0; i < dummyTodos.length; i++) {
      if (dummyTodos[i].id == todo.id) {
        dummyTodos[i] = todo;
      }
    }
  }
}
