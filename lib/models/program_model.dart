class ProgramModel {
  final String requestId;
  final List<Program> items;
  final int count;
  final String anyKey;

  ProgramModel({
    required this.requestId,
    required this.items,
    required this.count,
    required this.anyKey,
  });
  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> programItems = json['items'];
    List<Program> items = programItems.map((item) => Program.fromJson(item)).toList();

    return ProgramModel(
      requestId: json['requestId'],
      items: items,
      count: json['count'],
      anyKey: json['anyKey'],
    );
  }
}

class Program {
  final String createdAt;
  final String name;
  final int lessons;
  final String category;
  final String id;

  Program({
    required this.createdAt,
    required this.name,
    required this.lessons,
    required this.category,
    required this.id,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      createdAt: json['createdAt'],
      name: json['name'],
      lessons: json['lesson'],
      category: json['category'],
      id: json['id'],
    );
  }
}
