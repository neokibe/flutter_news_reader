import 'package:flutter_news_reader_app/core/data/network/news_api.dart';
import 'package:flutter_news_reader_app/core/model/article_response.dart';
import 'package:flutter_news_reader_app/core/model/news_response.dart';

class NewsRepository {
  final NewsApi newsApi;
  NewsRepository(this.newsApi);

  Stream<NewsResponse> getNews()=> newsApi.getNews();
  Future<ArticleResponse> getArticle(String id) async => await newsApi.getArticle(id);
}
