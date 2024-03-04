class Certification {
  const Certification({
    required this.id,
    required this.name,
    required this.url,
    required this.image_filename,
  });

  factory Certification.fromJson(Map<String, dynamic> json) => Certification(
    id: json['id'],
    name: json['name'],
    url: json['url'],
    image_filename: json['image_filename'],
  );

  final int id;
  final String name;
  final String url;
  final String image_filename;
}