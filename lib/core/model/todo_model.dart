class TodoModel {
  final String? todoId;
  final String? todoTitle;
  final String? todoDescription;
  final DateTime? createdAt;
  final bool? isCompleted;
  TodoModel({
    this.todoId,
    this.todoTitle,
    this.todoDescription,
    this.createdAt,
    this.isCompleted,
  });
}
