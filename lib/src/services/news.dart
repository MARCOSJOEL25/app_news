import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:providers_app_news/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final URL = "newsapi.org";
final APIKEY = "5fc576b33fc643ec817a6191549cad2d";

class news extends ChangeNotifier {
  List<Article> Headlines = [];

  news() {
    this.getTopHeadLines();
  }

  void getTopHeadLines() async {
    var url = Uri.https(URL, '/v2/top-headlines', {
      'country': 'us',
      'category': 'business',
      'apiKey': '5fc576b33fc643ec817a6191549cad2d'
    });

    final resp = await http.get(url);

    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body);
      final response = News.fromJson(data);
      Headlines.addAll(response.articles!);
      print('Response status: ${Headlines[1].author}');
    } else {
      print("something bad");
    }
  }
}
