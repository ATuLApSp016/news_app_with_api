import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_with_api/models/news_model.dart';
import 'package:news_app_with_api/pages/search.dart';
import 'package:news_app_with_api/utils/colors.dart';
import 'package:news_app_with_api/utils/style.dart';
import 'package:news_app_with_api/widget/common_container.dart';
import 'package:news_app_with_api/widget/searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get mIndex => mIndex;

  Future<NewsDataModel?> _buildNewArticles() async {
    NewsDataModel? mNewsData;
    String newsUrl =
        'https://newsapi.org/v2/everything?q=tesla&from=2024-04-21&sortBy=publishedAt&apiKey=80887a85ed6e44019a834c0ccf27e921';
    var response = await http.get(Uri.parse(newsUrl));

    if (response.statusCode == 200) {
      var mData = response.body;

      var newsArticle = jsonDecode(mData);
      print(newsArticle);

      mNewsData = NewsDataModel.fromJson(newsArticle);
    }
    return mNewsData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: _buildNewArticles(),
            builder: (_, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snap.hasError) {
                return Center(child: Text('Error: ${snap.hasError}'));
              } else if (snap.hasData) {
                var eachArticles = snap.data!.articles![mIndex];
                return snap.data != null
                    ? snap.data!.articles!.isNotEmpty
                        ? SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(21),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 21.0),
                                    child: Row(
                                      children: [
                                        const Text(''),
                                        Expanded(
                                          child: searchBar(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SearchPage(
                                                                newsData:
                                                                    eachArticles)));
                                              },
                                              icon: CupertinoIcons.search),
                                        ),
                                        const SizedBox(width: 11),
                                        CircleAvatar(
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          radius: 20,
                                          child: Icon(
                                            Icons.notifications_outlined,
                                            color: AppColors.formColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  commonRowContainer(
                                    mIndex: snap.data!.articles!.length,
                                    urlToImage:
                                        eachArticles.urlToImage.toString(),
                                    author: eachArticles.author.toString(),
                                    title: eachArticles.title.toString(),
                                    description:
                                        eachArticles.description.toString(),
                                  ),
                                  CommonSelectCategory(),
                                  commonColumnContainer(
                                    mIndex: snap.data!.articles!.length,
                                    urlToImage:
                                        eachArticles.urlToImage.toString(),
                                    author: eachArticles.author.toString(),
                                    title: eachArticles.title.toString(),
                                    publishedAt:
                                        eachArticles.publishedAt.toString(),
                                  )
                                ],
                              ),
                            ),
                          )
                        : const Center(child: Text('No products found!!'))
                    : const Center(child: CircularProgressIndicator());
              }
              return Container();
            }),
      ),
/*
      body: FutureBuilder(
          future: _buildNewArticles(),
          builder: (_, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snap.hasError) {
              return Center(child: Text('Error: ${snap.hasError}'));
            } else if (snap.hasData) {
              return snap.data != null
                  ? snap.data!.articles!.isNotEmpty
                      ? ListView.builder(
                          itemCount: snap.data!.articles!.length,
                          itemBuilder: (_, index) {
                            var eachUsers = snap.data!.articles![index];
                            return ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(eachUsers.urlToImage!)),
                              title: Text(eachUsers.title!),
                              subtitle: Text(eachUsers.description!),
                            );
                          })
                      : const Center(child: Text('No Data Found!!'))
                  : const Center(child: CircularProgressIndicator());
            }
            return Container();
          }),
*/
    );
  }
}
