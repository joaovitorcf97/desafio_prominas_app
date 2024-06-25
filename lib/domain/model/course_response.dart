// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_prominas_app/domain/model/discipline_response.dart';

class CourseResponse {
  final String id;
  final String title;
  final String description;
  final List<Disciplene>? disciplenes;

  CourseResponse({
    required this.id,
    required this.title,
    required this.description,
    this.disciplenes,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) {
    return CourseResponse(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      disciplenes: json['disciplenes'] != null
          ? List<Disciplene>.from(
              json['disciplenes'].map((x) => Disciplene.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
      };

  @override
  bool operator ==(covariant CourseResponse other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'CourseResponse(id: $id, title: $title, description: $description, disciplenes: $disciplenes)';
  }
}
