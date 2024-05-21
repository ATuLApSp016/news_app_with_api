import 'package:news_app_with_api/models/article_model.dart';

class NewsDataModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsDataModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsDataModel.fromJson(Map<String, dynamic> json) {
    List<Articles> mArArticles = [];

    for (Map<String, dynamic> eachArticles in json['articles']) {
      mArArticles.add(Articles.fromJson(eachArticles));
    }

    return NewsDataModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: mArArticles,
    );
  }
}
