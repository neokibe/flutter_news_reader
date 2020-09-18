import 'package:flutter/material.dart';
import 'package:flutter_news_reader_app/core/data/network/i_news_api.dart';
import 'package:flutter_news_reader_app/core/data/repositories/news_repository.dart';
import 'package:flutter_news_reader_app/presentation/blocs/news_bloc.dart';
import 'package:provider/provider.dart';
import 'presentation/views/home/home.dart';

void main() {
  final newsApi = INewsApi();
  runApp( Provider.value(
        value: NewsBloc(
          NewsRepository(newsApi),
        ),
        child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Nunito'),
    home:Home(),
  )));
}
