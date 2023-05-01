import 'dart:convert';

import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../Commons/Widgets/utils.dart';
import '../../../constants/Error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../provider/user_provider.dart';

class CartServices {
  void removeFromCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response response = await http.delete(
        Uri.parse('$uri/api/remove-from-cart/${product.id}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      bool success = httpErrorHandle(response: response, context: context);
      if (success) {
        User user =
            userProvider.user.copyWith(cart: jsonDecode(response.body)['cart']);
        userProvider.setUserFromModel(user);
      }
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    }
  }
}
