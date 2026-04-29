class Place {
  final String id;
  final String title;
  final String image;
  final String location;
  final String rating;
  final String description;

  Place({
    required this.id,
    required this.title,
    required this.image,
    required this.location,
    required this.rating,
    required this.description,
  });

  factory Place.formJson(Map<String, dynamic> json) {
    return Place(
      id: json['_id']?.toString() ?? "",
      title: json['title']?.toString() ?? "No Title",
      location: json['location']?.toString() ?? "Unknown Location",
      description: json['description']?.toString() ?? "",
      image: json['image']?.toString() ?? "",
      rating: json['rating']?.toString() ??  "0.0",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'location': location,
      'rating': rating,
      'description': description,
    };
  }
}
