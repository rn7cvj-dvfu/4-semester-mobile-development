class TaskViewModel {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final bool isFavourite;
  final DateTime createdAt;
  final String categoryId;

  const TaskViewModel({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    this.isFavourite = false,
    required this.createdAt,
    required this.categoryId,
  });
}
