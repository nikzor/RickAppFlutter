import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? gender;
  final String? image;

  const Character({
    required this.id,
    this.name,
    this.status,
    this.species,
    this.gender,
    this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        gender,
        image,
      ];
}
