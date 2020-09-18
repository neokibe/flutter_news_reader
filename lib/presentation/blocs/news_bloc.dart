import 'package:flutter_news_reader_app/core/data/repositories/news_repository.dart';
import 'package:flutter_news_reader_app/core/model/article_response.dart';
import 'package:flutter_news_reader_app/core/model/news_response.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final NewsRepository _newsRepository;
  NewsBloc(this._newsRepository);

  ///
  BehaviorSubject<NewsResponse> _newsResponseSubject =
      BehaviorSubject<NewsResponse>();
  ValueObservable<NewsResponse> get newsResponseStream =>
      _newsResponseSubject.stream;

  Future fetchNews() async {
    _newsRepository.getNews().listen(_newsResponseSubject.add);
  }

  ///

  ///
  BehaviorSubject<ArticleResponse> _articleResponseSubject =
      BehaviorSubject<ArticleResponse>();
  ValueObservable<ArticleResponse> get articleResponseStream =>
      _articleResponseSubject.stream;

  fetchArticle(String id) async {
    final response = await _newsRepository?.getArticle(id);
    _articleResponseSubject.sink.add(response);
  }

  ///

  dispose() {
    _articleResponseSubject.close();
    _newsResponseSubject.close();
  }
}
