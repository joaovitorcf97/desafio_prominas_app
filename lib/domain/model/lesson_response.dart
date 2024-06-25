class LessonResponse {
  final String id;
  final String title;
  final String description;
  final String videoUrl;
  final String material;
  final String disciplineId;

  LessonResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.material,
    required this.disciplineId,
  });

  factory LessonResponse.fromJson(Map<String, dynamic> map) {
    return LessonResponse(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      videoUrl: map['videoUrl'] as String,
      material: map['material'] as String,
      disciplineId: map['disciplineId'] as String,
    );
  }

  @override
  String toString() {
    return 'LessonResponse(id: $id, title: $title, description: $description, videoUrl: $videoUrl, material: $material, disciplineId: $disciplineId)';
  }

  @override
  bool operator ==(covariant LessonResponse other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.videoUrl == videoUrl &&
        other.material == material &&
        other.disciplineId == disciplineId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        videoUrl.hashCode ^
        material.hashCode ^
        disciplineId.hashCode;
  }
}
