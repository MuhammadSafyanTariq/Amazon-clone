import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/global_variables.dart';

class CategoryScreensDeal extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryScreensDeal({super.key, required this.category});

  @override
  State<CategoryScreensDeal> createState() => _CategoryScreensDealState();
}

class _CategoryScreensDealState extends State<CategoryScreensDeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          alignment: Alignment.topLeft,
          child: 'Keep shopping for ${widget.category}'.text.size(20).make(),
        )
      ]),
    );
  }
}
