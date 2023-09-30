import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

////////////////////////////////////////////////
///////////////////////////////////////////////////
//////////////////////////////////////////////
///// dio package
  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=3c88955c487e4d9db668f011dd85e737&category=$category');

      Map<String, dynamic> jsonData =
          response.data; // all data beautiful string in dio

      List<dynamic> articles = jsonData['articles']; // list of maps

      List<ArticleModel> articlesList = [];

// convert each small map (new) to obj and store objects in the list
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'],
          title: article['title'],
          subTitle: article['description'],
        );
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      return []; // لو حصل حاجه رجع ليست فارغه
    }
  }
}
