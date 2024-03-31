import 'dart:convert';

import 'package:flutter/foundation.dart';

class Report {
  final String id;
  final String title;
  final String description;
  final List<String> images;
  final DateTime createdAt;
  final String location;
  final int popularity;
  final double latitude;
  double longitude;

  Report({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.createdAt,
    required this.location,
    required this.popularity,
    required this.latitude,
    required this.longitude,
  });

  Report copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? images,
    DateTime? createdAt,
    String? location,
    int? popularity,
    double? latitude,
    double? longitude,
  }) {
    return Report(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      location: location ?? this.location,
      popularity: popularity ?? this.popularity,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'images': images,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'location': location,
      'popularity': popularity,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      images: List<String>.from((map['images'] as List<String>)),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      location: map['location'] as String,
      popularity: map['popularity'] as int,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) =>
      Report.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Report(id: $id, title: $title, description: $description, images: $images, createdAt: $createdAt, location: $location, popularity: $popularity, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant Report other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        listEquals(other.images, images) &&
        other.createdAt == createdAt &&
        other.location == location &&
        other.popularity == popularity &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        images.hashCode ^
        createdAt.hashCode ^
        location.hashCode ^
        popularity.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
