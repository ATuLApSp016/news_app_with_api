import 'package:flutter/material.dart';
import 'package:news_app_with_api/utils/colors.dart';

Widget commonRowContainer({
  required String urlToImage,
  int? mIndex,
  required String author,
  required String title,
  required String description,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Latest News',
              style: TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                fontSize: 18,
              )),
          Row(
            children: [
              Text('View all',
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    fontSize: 12,
                  )),
              const SizedBox(width: 21),
              Icon(Icons.arrow_forward_outlined,
                  color: AppColors.secondaryColor)
            ],
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 11),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              mIndex!,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  width: 320,
                  height: 250,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(urlToImage),
                                fit: BoxFit.fill)),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Text(author,
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                    fontSize: 10,
                                  )),
                              const SizedBox(height: 11),
                              Text(title,
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.7,
                                    fontSize: 16,
                                  )),
                              const SizedBox(height: 31),
                              Text(description,
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0.5,
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget commonColumnContainer({
  required String urlToImage,
  int? mIndex,
  required String author,
  required String title,
  required String publishedAt,
}) {
  return Column(
    children: List.generate(
      mIndex!,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SizedBox(
          height: 150,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage(urlToImage), fit: BoxFit.fill)),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Column(
                    children: [
                      Text(title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                            fontSize: 14,
                          )),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(author,
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                                fontSize: 12,
                              )),
                          Text(publishedAt,
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

/*Widget commonSelectCategory() {
  List<String> categoryList = [
    'Healthy',
    'Technology',
    'Finance',
    'Arts',
    'Sports',
    'Healthy',
    'Technology',
    'Finance',
    'Arts',
    'Sports',
  ];
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
        categoryList.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              selectCategory = index;
            });
          },
          child: Container(
              margin: const EdgeInsets.all(11),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 11),
              decoration: selectCategory == index
                  ? BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(32),
                    )
                  : BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(32),
                      border:
                          Border.all(width: 1, color: AppColors.lightTextColor),
                    ),
              child: Text(categoryList[index].toString(),
                  style: TextStyle(
                    color: selectCategory == index
                        ? AppColors.whiteColor
                        : AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.7,
                    fontSize: 12,
                  ))),
        ),
      ),
    ),
  );
}*/

class CommonSelectCategory extends StatefulWidget {
  @override
  State<CommonSelectCategory> createState() => _CommonSelectCategoryState();
}

class _CommonSelectCategoryState extends State<CommonSelectCategory> {
  int selectCategory = 0;

  List<String> categoryList = [
    'Healthy',
    'Technology',
    'Finance',
    'Arts',
    'Sports',
    'Healthy',
    'Technology',
    'Finance',
    'Arts',
    'Sports',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categoryList.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                selectCategory = index;
              });
            },
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 21, horizontal: 5),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 11),
                decoration: selectCategory == index
                    ? BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(32),
                      )
                    : BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                            width: 1, color: AppColors.lightTextColor),
                      ),
                child: Text(categoryList[index].toString(),
                    style: TextStyle(
                      color: selectCategory == index
                          ? AppColors.whiteColor
                          : AppColors.blackColor,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.7,
                      fontSize: 12,
                    ))),
          ),
        ),
      ),
    );
  }
}
