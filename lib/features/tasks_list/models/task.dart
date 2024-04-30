class TaskViewModel {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final bool isFavourite;
  final DateTime createdAt;
  final String categoryId;

  TaskViewModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.isFavourite,
    required this.createdAt,
    required this.categoryId,
  });
}
