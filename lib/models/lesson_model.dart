class LessonModel {
  final String requestId;
  final List<Lesson> items;
  final int count;
  final String anyKey;

  LessonModel({
    required this.requestId,
    required this.items,
    required this.count,
    required this.anyKey,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> lessonItems = json['items'];
    List<Lesson> items =
        lessonItems.map((item) => Lesson.fromJson(item)).toList();

    return LessonModel(
      requestId: json['requestId'],
      items: items,
      count: json['count'],
      anyKey: json['anyKey'],
    );
  }
}

class Lesson {
  final String createdAt;
  final String name;
  final int duration;
  final String category;
  final bool locked;
  final String id;

  Lesson({
    required this.createdAt,
    required this.name,
    required this.duration,
    required this.category,
    required this.locked,
    required this.id,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      createdAt: json['createdAt'],
      name: json['name'],
      duration: json['duration'],
      category: json['category'],
      locked: json['locked'],
      id: json['id'],
    );
  }
}
