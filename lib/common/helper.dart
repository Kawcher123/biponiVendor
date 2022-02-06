import 'dart:convert' as convert;
import 'dart:io' as io;

import 'package:flutter/services.dart';

class Helper {
  static Future<dynamic> getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }

  static getStatus(String status) {
    var orderStatus = '';
    if (status == '1') {
      orderStatus = 'Pending';
    } else if (status == '2') {
      orderStatus = 'Processing';
    } else if (status == '3') {
      orderStatus = 'On Hold';
    } else if (status == '4') {
      orderStatus = 'Failed';
    } else if (status == '5') {
      orderStatus = 'Cancelled';
    } else if (status == '6') {
      orderStatus = 'Completed';
    } else {
      orderStatus = 'Refunded';
    }

    return orderStatus;
  }
}
