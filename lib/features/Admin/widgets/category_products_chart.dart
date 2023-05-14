import 'package:amazon_clone/features/Admin/models/adminModel.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as chart;

class CategoryProductsChart extends StatelessWidget {
  final List<chart.Series<Sales, String>> seriesList;

  CategoryProductsChart({super.key, required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return chart.BarChart(
      seriesList,
      animate: true,
    );
  }
}
