// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../locations_part.dart';

@JsonSerializable()
class Location {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List residents;
  final String url;
  final String created;

  Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
