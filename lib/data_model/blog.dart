class Blog {
  final String id;
  final String title;
  final String imageUrl;

  Blog({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json['id'],
        title: json['title'],
        imageUrl: json['image_url'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image_url': imageUrl,
      };
}
