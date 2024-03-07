class Portfolio {
  const Portfolio({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.image_filename,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      url: json['url'],
      image_filename: json['image_filename'],
  );

  final int id;
  final String name;
  final String description;
  final String url;
  final String image_filename;
}