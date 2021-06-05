import 'package:flutter/material.dart';

class PeopleModel {
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;

  PeopleModel(
      {@required this.name,
      @required this.height,
      @required this.mass,
      @required this.hairColor,
      @required this.skinColor,
      @required this.eyeColor,
      @required this.birthYear});

  PeopleModel copWith(
      {String name,
      String height,
      String mass,
      String hairColor,
      String skinColor,
      String eyeColor,
      String birthYear}) {
    return PeopleModel(
        name: name ?? this.name,
        height: height ?? this.height,
        mass: mass ?? this.mass,
        hairColor: hairColor ?? this.hairColor,
        skinColor: skinColor ?? this.skinColor,
        eyeColor: eyeColor ?? this.eyeColor,
        birthYear: birthYear ?? this.birthYear);
  }

  factory PeopleModel.fromJson(Map<String, dynamic> json) {
    return PeopleModel(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"]);
  }
}
