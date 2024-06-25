// ignore_for_file: public_member_api_docs, sort_constructors_first

class Disciplene {
  final String id;
  final String title;
  final String description;
  final String material;

  Disciplene({
    required this.id,
    required this.title,
    required this.description,
    required this.material,
  });

  factory Disciplene.fromJson(Map<String, dynamic> json) {
    return Disciplene(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        material: json['material']);
  }

  @override
  bool operator ==(covariant Disciplene other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode;

  @override
  String toString() =>
      'Disciplene(id: $id, title: $title, description: $description)';
}
