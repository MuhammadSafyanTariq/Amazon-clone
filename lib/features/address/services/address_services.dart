import 'dart:convert';
import 'dart:io';
import 'package:amazon_clone/Commons/Widgets/utils.dart';
import 'package:amazon_clone/constants/Error_handling.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../constants/global_variables.dart';

class AddressServices {
  void saveUserAddress({
    required BuildContext context,
    required String address,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/save-user-address'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'address': address,
        }),
      );
      if (response.statusCode == 400) {
        throw const HttpException('Bad request');
      }
      bool success = httpErrorHandle(response: response, context: context);
      if (success) {
        User user = userProvider.user.copyWith(
          address: jsonDecode(response.body)['address'],
        );

        userProvider.setUserFromModel(user);
      }
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    } on HttpException catch (e) {
      showSnackBar(context: context, text: e.toString());
    } catch (err) {
      showSnackBar(context: context, text: err.toString());
    }
  }

  void placeOrder(
      {required BuildContext context,
      required String address,
      required double totalSum}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/order'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          },
          body: jsonEncode({
            'cart': userProvider.user.cart,
            'address': address,
            'totalPrice': totalSum,
          }));

      bool success = httpErrorHandle(
        response: res,
        context: context,
      );
      if (success) {
        showSnackBar(
          context: context,
          text: "Congratulations! Your order has been placed",
        );
        User user = userProvider.user.copyWith(
          cart: [],
        );
        userProvider.setUserFromModel(user);
      }
    } catch (err) {
      showSnackBar(context: context, text: 'eeee $err');
    }
  }

  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {
            'id': product.id,
          },
        ),
      );
      if (response.statusCode == 400) {
        throw const HttpException('Bad request');
      }
      bool success = httpErrorHandle(response: response, context: context);
      if (success) {
        onSuccess();
      }
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    }
  }
}
