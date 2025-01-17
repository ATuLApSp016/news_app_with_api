class Articles {
  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      source: SourceModel.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}

class SourceModel {
  int? id;
  String? name;

  SourceModel({required this.id, required this.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(id: json['id'], name: json['name']);
  }
}
