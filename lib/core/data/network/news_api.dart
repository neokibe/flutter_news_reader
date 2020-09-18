import 'package:flutter_news_reader_app/core/model/article_response.dart';
import 'package:flutter_news_reader_app/core/model/news_response.dart';

abstract class NewsApi {
  Stream<NewsResponse> getNews();
  Future<ArticleResponse> getArticle(String id);
  
}