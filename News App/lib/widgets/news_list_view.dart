import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/services/news_service.dart';

import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListView({required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      // instaed of listview.builder
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsTile(
              articleModel: articles[index],
            ),
          );
        },
        childCount: articles.length,
      ),
    );
  }
}
