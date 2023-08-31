class Todo {
  Todo(
      {required this.title,
      required this.description,
      this.isDone = false,
      this.index = -1});
  final String title;
  final String description;
  final bool isDone;
  final int index;

  Todo copyWith({
    String? title,
    String? description,
    bool? isDone,
  }) {
    return Todo(
      index: index,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
