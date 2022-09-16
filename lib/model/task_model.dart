class TaskModel {
  final String date;
  final String category;
  final String title;
  final String note;
  int? id;
  int? isCompleted;

  TaskModel({
    required this.date,
    required this.category,
    required this.title,
    required this.note,
    this.id,
    this.isCompleted = 0,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      date: json['date'],
      category: json['category'],
      title: json['title'],
      note: json['note'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'category': category,
      'title': title,
      'note': note,
      'isCompleted': isCompleted,
    };
  }
}
