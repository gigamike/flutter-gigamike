class Post {
  const Post({
    required this.id,
    required this.date,
    required this.title,
    required this.link,
    required this.excerpt,
    required this.featuredmedia,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'],
    date: json['date'],
    title: json['title']['rendered'],
    link: json['link'],
    excerpt: json['excerpt']['rendered'],
    featuredmedia: json['_embedded']['wp:featuredmedia'][0]['source_url'],
  );

  final int id;
  final String date;
  final String title;
  final String link;
  final String excerpt;
  final String featuredmedia;
}