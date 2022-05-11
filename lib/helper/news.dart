import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String urlData =
        "https://newsapi.org/v2/top-headlines?country=za&category=business&apiKey=cd87473495ed4fd585bbaccf6d8376b2";

    var response = await http.get(Uri.parse(urlData));

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articlemodel = ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"]);

          news.add(articlemodel);
        }
      });
    }
  }
}
