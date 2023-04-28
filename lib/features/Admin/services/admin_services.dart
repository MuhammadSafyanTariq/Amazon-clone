import 'dart:io';

// import 'package:amazon_clone/Commons/Widgets/utils.dart';
// import 'package:amazon_clone/constants/Error_handling.dart';
// import 'package:amazon_clone/models/product.dart';
// import 'package:amazon_clone/provider/user_provider.dart';
// import 'package:amazon_clone/provider/user_provider.dart';
// import 'package:cloudinary_public/cloudinary_public.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// import '../../../constants/global_variables.dart';

// class AdminServices {
//   void sellProduct({
//     required BuildContext context,
//     required String name,
//     required String description,
//     required double price,
//     required double quantity,
//     required String category,
//     required List<File> images,
//   }) async {
//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     try {
//       final cloudinary = CloudinaryPublic('dlw2tonlf', 'u2q8aycy');
//       List<String> imagesUrl = [];

//       for (int i = 0; i < images.length; i++) {
//         CloudinaryResponse res = await cloudinary.uploadFile(
//           CloudinaryFile.fromFile(images[i].path, folder: name),
//         );
//         imagesUrl.add(res.secureUrl);
//       }
//       Product product = Product(
//         name: name,
//         description: description,
//         quantity: quantity,
//         images: imagesUrl,
//         category: category,
//         price: price,
//       );
//       http.Response response = await http.post(
//         Uri.parse('$uri/admin/add-product'),
//         headers: {
//           'Content-Type': 'application/json; charset=UTF-8',
//           'x-auth-token': userProvider.user.token,
//         },
//         body: product.toJson(),
//       );
//       bool success = httpErrorHandle(response: response, context: context);
//       if (success) {
//         showSnackBar(context: context, text: "Successfully added product");
//         Navigator.pop(context);
//       }
//     } catch (err) {
//       showSnackBar(context: context, text: err.toString());
//     }
//   }
// }

import 'package:amazon_clone/Commons/Widgets/utils.dart';
import 'package:amazon_clone/constants/Error_handling.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('dlw2tonlf', 'ghanuzzb');
      List<String> imagesUrl = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imagesUrl.add(res.secureUrl);
      }
      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imagesUrl,
        category: category,
        price: price,
      );
      http.Response response = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );
      if (response.statusCode == 400) {
        throw HttpException('Bad request');
      }
      bool success = httpErrorHandle(response: response, context: context);
      if (success) {
        showSnackBar(context: context, text: "Successfully added product");
        Navigator.pop(context);
      }
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    } on HttpException catch (e) {
      showSnackBar(context: context, text: e.toString());
    } catch (err) {
      showSnackBar(context: context, text: err.toString());
    }
  }
}
