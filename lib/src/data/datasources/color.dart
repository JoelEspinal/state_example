import 'dart:convert';

class Color {
  final int id;
  final String name;
  Color({
    required this.id,
    required this.name,
  });

  Color copyWith({
    int? id,
    String? name,
  }) {
    return Color(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Color.fromMap(Map<String, dynamic> map) {
    return Color(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Color.fromJson(String source) => Color.fromMap(json.decode(source));

  @override
  String toString() => 'Color(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Color && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
