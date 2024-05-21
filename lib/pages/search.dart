import 'package:flutter/material.dart';
import 'package:news_app_with_api/models/article_model.dart';
import 'package:news_app_with_api/utils/colors.dart';
import 'package:news_app_with_api/widget/common_container.dart';
import 'package:news_app_with_api/widget/searchbar.dart';

class SearchPage extends StatelessWidget {
  final Articles newsData;
  const SearchPage({super.key, required this.newsData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11.0),
                    child: searchBar(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        icon: Icons.close)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11.0),
                  child: CommonSelectCategory(),
                ),
                Text('About 155555 results',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.7,
                      fontSize: 14,
                    )),
                commonColumnContainer(
                  urlToImage: newsData.urlToImage.toString(),
                  author: newsData.author.toString(),
                  title: newsData.title.toString(),
                  publishedAt: newsData.publishedAt.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
