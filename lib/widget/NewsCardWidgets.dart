import 'package:flutter/material.dart';
import 'package:news_api/model/Article.dart';

class NewsCardWidgets extends StatelessWidget {
  final Article article;
  const NewsCardWidgets({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Image.network(
            '${article.urlToImage}',
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            article.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            article.description,
            style: const TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
