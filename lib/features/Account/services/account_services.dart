import 'dart:convert';
import 'package:amazon_clone/models/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../Commons/Widgets/utils.dart';
import '../../../constants/Error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../provider/user_provider.dart';

class AccountServices {
  Future<List<Order>> fetchMyOrders({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Order> orderList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/orders/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      bool success = httpErrorHandle(
        response: res,
        context: context,
      );
      for (int i = 0; i < jsonDecode(res.body).length; i++) {
        orderList.add(
          Order.fromJson(
            jsonEncode(
              jsonDecode(res.body)[i],
            ),
          ),
        );
      }
    } catch (err) {
      showSnackBar(context: context, text: 'eeee' + err.toString());
      print(err.toString());
    }
    return orderList;
  }
}
