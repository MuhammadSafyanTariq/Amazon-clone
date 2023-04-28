import 'dart:convert';

import 'package:amazon_clone/Commons/Widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

bool httpErrorHandle({
  required http.Response response,
  required BuildContext context,
}) {
  switch (response.statusCode) {
    case 200:
      return true;
    case 201:
      return true;
    case 400:
      showSnackBar(
          context: context,
          text: jsonDecode("error 400" + response.body)['msg']);
      break;
    case 500:
      showSnackBar(
          context: context,
          text: jsonDecode("error 500${response.body}")['error']);
      break;
    default:
      showSnackBar(
          context: context, text: "default" + response.statusCode.toString());
  }
  return false;
}
