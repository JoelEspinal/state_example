import 'dart:convert';

import 'species.dart';

class Pockemon {
  final int id;
  final String name;
  final int order;
  final String color;
  // final Species species;
  Pockemon({
    required this.id,
    required this.name,
    required this.order,
    required this.color,
    // required this.species,
  });

  Pockemon copyWith({
    int? id,
    String? name,
    int? order,
    String? color,
    Species? species,
  }) {
    return Pockemon(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      color: color ?? this.color,
      // species: species ?? this.species,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'order': order,
      'color': color,
      // 'species': species.toMap(),
    };
  }

  factory Pockemon.fromMap(Map<String, dynamic> map) {
    return Pockemon(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      order: map['order']?.toInt() ?? 0,
      color: map['color'] ?? '',
      // species: Species.fromMap(map['species']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Pockemon.fromJson(String source) =>
      Pockemon.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pockemon(id: $id, name: $name, order: $order, color: $color)'; //, species: $species)';
  }

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;

    return other is Pockemon &&
        other.id == id &&
        other.name == name &&
        other.order == order &&
        other.color == color;
    //  && other.species == species;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ order.hashCode ^ color.hashCode;
    // ^ species.hashCode;
  }
}
