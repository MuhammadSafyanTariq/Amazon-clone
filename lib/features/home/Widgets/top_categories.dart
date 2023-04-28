import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../screens/category_deals_screens.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});
  void navigateTOCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(
      context,
      CategoryScreensDeal.routeName,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          itemExtent: 75,
          scrollDirection: Axis.horizontal,
          itemCount: GlobalVariables.categoryImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => navigateTOCategoryPage(
                context,
                GlobalVariables.categoryImages[index]['title']!,
              ),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          GlobalVariables.categoryImages[index]['image']!,
                          fit: BoxFit.cover,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    GlobalVariables.categoryImages[index]['title']!,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  )
                ],
              ),
            );
          }),
    );
  }
}
