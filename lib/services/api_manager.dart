import 'dart:convert';

import 'package:flutter_rest_api_news_app/constants/string_constants.dart';
import 'package:flutter_rest_api_news_app/models/news_info.dart';
import 'package:http/http.dart' as http;

class APIManager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;
    try {
      var response = await client.get(StringConstants.newsUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}
