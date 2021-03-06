import 'package:flutter/material.dart';
import 'package:flutter_news_reader_app/core/model/news.dart';
import 'package:flutter_news_reader_app/presentation/views/detail/news_detailpage.dart';

class NewsRow extends StatefulWidget {
  final News news;

  NewsRow(this.news);

  @override
  _NewsRowState createState() => _NewsRowState();
}

class _NewsRowState extends State<NewsRow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CircleAvatar channelLogo(var url) {
      try {
        return new CircleAvatar(
          backgroundImage: new NetworkImage(widget.news.icons[1].url),
        );
      } catch (Exception) {
        return new CircleAvatar(
          child: new Icon(Icons.library_books),
        );
      }
    }

    final newsCard = Container(
        child: GridTile(
            child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: new Container(
              child: channelLogo(widget.news.url),
              width: 130.0,
              height: 130.0,
              padding: const EdgeInsets.all(3.0),
              // border width
              decoration: new BoxDecoration(
                color: Colors.teal, // border color
                shape: BoxShape.circle,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 4.0, left: 4.0),
          child: Text(
            widget.news.name,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    )));
    return new Container(
      child: GestureDetector(
        onTap: () {
          if (widget.news.id.toString().isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsDetailPage(
                      id: widget.news.id, channel: widget.news.name)),
            );
          }
        },
        child: newsCard,
      ),
    );
  }
}
