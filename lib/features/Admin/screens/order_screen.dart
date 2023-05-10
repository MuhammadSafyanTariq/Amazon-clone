import 'package:amazon_clone/Commons/Widgets/loader.dart';
import 'package:amazon_clone/features/Account/Widgets/single_product.dart';
import 'package:amazon_clone/features/Admin/services/admin_services.dart';
import 'package:amazon_clone/features/order_details/Screens/order_detail.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  AdminServices adminServices = AdminServices();
  List<Order>? orderList;
  void fetchAllOrders() async {
    orderList = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return orderList == null
        ? const Loader()
        : GridView.builder(
            itemCount: orderList!.length,
            itemBuilder: (BuildContext context, int index) {
              final orderData = orderList![index];
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  OrderDetailScreen.routeName,
                  arguments: orderData,
                ),
                child: SizedBox(
                  height: 140,
                  child: SingleProduct(
                    image: orderData.products[0].images[0],
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
          );
  }
}
