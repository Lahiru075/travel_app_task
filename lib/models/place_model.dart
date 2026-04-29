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
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      location: json['location'] as String,
      rating: json['rating'] as String,
      description: json['description'] as String,
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
