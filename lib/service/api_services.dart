import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_api/model/Article.dart';

///Have To Change The Date Accordingly Because This NewsApi Has 1 Month of Data Only
class ApiService {
  final endPoint =
      "https://newsapi.org/v2/everything?q=tesla&from=2023-04-25&sortBy=publishedAt&apiKey=4a391eb2d1394a038152fb079373b327";
  Future<List<Article>> getArticle() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw 'Data not found';
    }
  }
}
