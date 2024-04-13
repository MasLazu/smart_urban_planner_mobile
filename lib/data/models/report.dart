import 'dart:convert';

class Report {
  final String id;
  final String title;
  final String description;
  final String image;
  final DateTime createdAt;
  final String address;
  final int popularity;
  final double latitude;
  double longitude;

  Report({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.address,
    required this.popularity,
    required this.latitude,
    required this.longitude,
  });

  Report copyWith({
    String? id,
    String? title,
    String? description,
    String? image,
    DateTime? createdAt,
    String? address,
    int? popularity,
    double? latitude,
    double? longitude,
  }) {
    return Report(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      address: address ?? this.address,
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
      'image': image,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'address': address,
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
      image: map['image'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
      address: map['address'] as String,
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
    return 'Report(id: $id, title: $title, description: $description, image: $image, created_at: $createdAt, address: $address, popularity: $popularity, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant Report other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.image == image &&
        other.createdAt == createdAt &&
        other.address == address &&
        other.popularity == popularity &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        image.hashCode ^
        createdAt.hashCode ^
        address.hashCode ^
        popularity.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
