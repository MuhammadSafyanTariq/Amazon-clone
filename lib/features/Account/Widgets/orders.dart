import 'package:amazon_clone/Commons/Widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/Account/Widgets/single_product.dart';
import 'package:amazon_clone/features/Account/services/account_services.dart';
import 'package:amazon_clone/features/order_details/Screens/order_detail.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order>? orders;

  AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text(
                      'Your Orders',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: GlobalVariables.selectedNavBarColor,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 170,
                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: orders!.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        OrderDetailScreen.routeName,
                        arguments: orders![index],
                      ),
                      child: SingleProduct(
                        image: orders![index].products[0].images[0],
                      ),
                    );
                  }),
                ),
              )
            ],
          );
  }
}
